package com.partysync.party_sync

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.BatteryManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * Bridges the Dart session engine to Android audio, Wi-Fi and services.
 *
 *  party_sync/audio   (methods)  capture + scheduled playback
 *  party_sync/capture (events)   mic frames for the host
 *  party_sync/net     (methods)  Wi-Fi join/bind, Wi-Fi Direct, permissions, keep-alive
 */
class PartySyncPlugin : FlutterPlugin, ActivityAware,
    PluginRegistry.RequestPermissionsResultListener {

    private lateinit var appContext: Context
    private lateinit var wifi: WifiController
    private val main = Handler(Looper.getMainLooper())

    private var audioChannel: MethodChannel? = null
    private var netChannel: MethodChannel? = null
    private var captureChannel: EventChannel? = null
    private var captureSink: EventChannel.EventSink? = null
    private var activityBinding: ActivityPluginBinding? = null

    private var capture: AudioCapture? = null
    private var playout: AudioPlayout? = null
    private var outputOffsetUs = 0L
    private var pushScratch = ShortArray(1024)
    private var pendingPermissions: Pair<Map<String, List<String>>, MethodChannel.Result>? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        appContext = binding.applicationContext
        wifi = WifiController(appContext)
        WallClock.calibrate()
        audioChannel = MethodChannel(binding.binaryMessenger, "party_sync/audio")
            .also { it.setMethodCallHandler(::onAudioCall) }
        netChannel = MethodChannel(binding.binaryMessenger, "party_sync/net")
            .also { it.setMethodCallHandler(::onNetCall) }
        captureChannel = EventChannel(binding.binaryMessenger, "party_sync/capture").also {
            it.setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                    captureSink = events
                }

                override fun onCancel(arguments: Any?) {
                    captureSink = null
                }
            })
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        capture?.stop()
        playout?.stop()
        capture = null
        playout = null
        wifi.release()
        KeepAliveService.stop(appContext)
        audioChannel?.setMethodCallHandler(null)
        netChannel?.setMethodCallHandler(null)
        captureChannel?.setStreamHandler(null)
    }

    // ---- Audio --------------------------------------------------------------

    private fun onAudioCall(call: MethodCall, result: MethodChannel.Result) {
        try {
            when (call.method) {
                "startCapture" -> {
                    capture?.stop()
                    capture = AudioCapture { frame -> main.post { captureSink?.success(frame) } }
                        .also {
                            it.start(
                                call.argument<Int>("sampleRate")!!,
                                call.argument<Int>("frameSamples")!!,
                                call.argument<Boolean>("voiceProcessing") ?: true,
                            )
                        }
                    result.success(null)
                }
                "stopCapture" -> {
                    capture?.stop()
                    capture = null
                    result.success(null)
                }
                "startPlayback" -> {
                    playout?.stop()
                    playout = AudioPlayout(appContext).also {
                        it.userOffsetUs = outputOffsetUs
                        it.start(call.argument<Int>("sampleRate")!!, call.argument<Int>("frameSamples")!!)
                    }
                    result.success(null)
                }
                "stopPlayback" -> {
                    playout?.stop()
                    playout = null
                    result.success(null)
                }
                "push" -> {
                    val bytes = call.arguments as ByteArray
                    val bb = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
                    val first = bb.long
                    val playAtUs = bb.long
                    val count = bb.remaining() / 2
                    if (pushScratch.size < count) pushScratch = ShortArray(count)
                    bb.asShortBuffer().get(pushScratch, 0, count)
                    playout?.buffer?.push(first, playAtUs, pushScratch, count)
                    result.success(null)
                }
                "setOutputOffset" -> {
                    outputOffsetUs = ((call.argument<Double>("ms") ?: 0.0) * 1000).toLong()
                    playout?.userOffsetUs = outputOffsetUs
                    result.success(null)
                }
                "stats" -> result.success(playout?.stats() ?: emptyMap<String, Any>())
                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            result.error("audio", e.message ?: e.toString(), null)
        }
    }

    // ---- Network, permissions, services ---------------------------------------

    private fun onNetCall(call: MethodCall, result: MethodChannel.Result) {
        try {
            when (call.method) {
                "capabilities" -> result.success(wifi.capabilities())
                "requestPermissions" -> {
                    @Suppress("UNCHECKED_CAST")
                    requestPermissions(call.arguments as List<String>, result)
                }
                "joinWifi" -> wifi.join(
                    call.argument<String>("ssid")!!,
                    call.argument<String>("password") ?: ""
                ) { error ->
                    if (error == null) result.success(null) else result.error("wifi", error, null)
                }
                "leaveWifi" -> {
                    wifi.leave()
                    result.success(null)
                }
                "bindProcessToWifi" -> result.success(wifi.bindProcessToWifi())
                "unbindProcess" -> {
                    wifi.unbindProcess()
                    result.success(null)
                }
                "createNetwork" -> wifi.createGroup(
                    call.argument<String>("name")!!,
                    call.argument<String>("password")!!
                ) { info, error ->
                    if (info != null) result.success(info) else result.error("network", error, null)
                }
                "removeNetwork" -> wifi.removeGroup { result.success(null) }
                "openHotspotSettings" -> result.success(openHotspotSettings())
                "battery" -> result.success(
                    appContext.getSystemService(BatteryManager::class.java)
                        .getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
                )
                "startKeepAlive" -> {
                    KeepAliveService.start(
                        appContext,
                        call.argument<Boolean>("microphone") ?: false,
                        call.argument<String>("text") ?: "Party Sync is running"
                    )
                    result.success(null)
                }
                "stopKeepAlive" -> {
                    KeepAliveService.stop(appContext)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            result.error("net", e.message ?: e.toString(), null)
        }
    }

    private fun openHotspotSettings(): Boolean {
        val intents = listOf(
            Intent().setClassName("com.android.settings", "com.android.settings.TetherSettings"),
            Intent(Settings.ACTION_WIRELESS_SETTINGS),
        )
        for (intent in intents) {
            try {
                val activity = activityBinding?.activity
                if (activity != null) activity.startActivity(intent)
                else appContext.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
                return true
            } catch (_: Exception) {
            }
        }
        return false
    }

    private fun androidPermissionsFor(name: String): List<String> = when (name) {
        "microphone" -> listOf(Manifest.permission.RECORD_AUDIO)
        "notifications" ->
            if (Build.VERSION.SDK_INT >= 33) listOf(Manifest.permission.POST_NOTIFICATIONS) else emptyList()
        "wifi" ->
            if (Build.VERSION.SDK_INT >= 33) listOf(Manifest.permission.NEARBY_WIFI_DEVICES)
            else listOf(Manifest.permission.ACCESS_FINE_LOCATION)
        else -> emptyList()
    }

    private fun granted(permission: String) =
        appContext.checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED

    private fun permissionResult(mapping: Map<String, List<String>>) =
        mapping.mapValues { (_, perms) -> perms.all(::granted) }

    private fun requestPermissions(names: List<String>, result: MethodChannel.Result) {
        val mapping = names.associateWith(::androidPermissionsFor)
        val missing = mapping.values.flatten().distinct().filterNot(::granted)
        val activity = activityBinding?.activity
        if (missing.isEmpty() || activity == null) {
            result.success(permissionResult(mapping))
            return
        }
        if (pendingPermissions != null) {
            result.error("busy", "A permission request is already showing.", null)
            return
        }
        pendingPermissions = mapping to result
        activity.requestPermissions(missing.toTypedArray(), PERMISSION_REQUEST)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int, permissions: Array<out String>, grantResults: IntArray
    ): Boolean {
        if (requestCode != PERMISSION_REQUEST) return false
        val (mapping, result) = pendingPermissions ?: return false
        pendingPermissions = null
        result.success(permissionResult(mapping))
        return true
    }

    // ---- ActivityAware ------------------------------------------------------

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityBinding = binding
        binding.addRequestPermissionsResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() = onDetachedFromActivity()

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) =
        onAttachedToActivity(binding)

    override fun onDetachedFromActivity() {
        activityBinding?.removeRequestPermissionsResultListener(this)
        activityBinding = null
    }

    private companion object {
        const val PERMISSION_REQUEST = 4780
    }
}
