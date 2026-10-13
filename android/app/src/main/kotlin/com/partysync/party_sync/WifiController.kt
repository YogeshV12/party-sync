package com.partysync.party_sync

import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.PackageManager
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.WifiNetworkSpecifier
import android.net.wifi.p2p.WifiP2pConfig
import android.net.wifi.p2p.WifiP2pManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import java.net.Inet4Address
import java.net.NetworkInterface

/**
 * Android Wi-Fi plumbing:
 *  - joining the host's or a relay's network (WifiNetworkSpecifier; the OS
 *    shows a one-tap "Connect" sheet),
 *  - pinning the upstream socket to that Wi-Fi even when mobile data is the
 *    default network,
 *  - creating a Wi-Fi Direct group that any phone (iPhones included) can join
 *    like a normal hotspot, while staying connected upstream (relay mode).
 */
class WifiController(private val context: Context) {
    private val main = Handler(Looper.getMainLooper())
    private val cm = context.getSystemService(ConnectivityManager::class.java)
    private val p2p: WifiP2pManager? = context.getSystemService(WifiP2pManager::class.java)
    private var p2pChannel: WifiP2pManager.Channel? = null

    private var joinCallback: ConnectivityManager.NetworkCallback? = null
    @Volatile private var joinedNetwork: Network? = null
    @Volatile private var anyWifiNetwork: Network? = null

    private val wifiWatcher = object : ConnectivityManager.NetworkCallback() {
        override fun onAvailable(network: Network) {
            anyWifiNetwork = network
        }

        override fun onLost(network: Network) {
            if (anyWifiNetwork == network) anyWifiNetwork = null
        }
    }

    init {
        cm.registerNetworkCallback(
            NetworkRequest.Builder()
                .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
                .removeCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                .build(),
            wifiWatcher
        )
    }

    fun release() {
        leave()
        try {
            cm.unregisterNetworkCallback(wifiWatcher)
        } catch (_: Exception) {
        }
    }

    fun capabilities(): Map<String, Any> {
        val wifiDirect = p2p != null &&
            context.packageManager.hasSystemFeature(PackageManager.FEATURE_WIFI_DIRECT)
        val manufacturer = Build.MANUFACTURER.replaceFirstChar { it.uppercase() }
        val model = if (Build.MODEL.startsWith(manufacturer, ignoreCase = true)) Build.MODEL
        else "$manufacturer ${Build.MODEL}"
        return mapOf(
            "platform" to "android",
            "model" to model,
            "sdk" to Build.VERSION.SDK_INT,
            "canCreateNetwork" to wifiDirect,
            "canRelay" to wifiDirect,
        )
    }

    // ---- Joining ------------------------------------------------------------

    fun join(ssid: String, password: String, done: (String?) -> Unit) {
        leave()
        val specifier = WifiNetworkSpecifier.Builder()
            .setSsid(ssid)
            .apply { if (password.isNotEmpty()) setWpa2Passphrase(password) }
            .build()
        val request = NetworkRequest.Builder()
            .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
            .removeCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
            .setNetworkSpecifier(specifier)
            .build()
        var finished = false
        fun finish(error: String?) = main.post {
            if (!finished) {
                finished = true
                done(error)
            }
        }
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                joinedNetwork = network
                finish(null)
            }

            override fun onUnavailable() {
                finish("Couldn't join \"$ssid\". The request was cancelled or the network wasn't found.")
            }

            override fun onLost(network: Network) {
                if (joinedNetwork == network) joinedNetwork = null
            }
        }
        joinCallback = callback
        try {
            cm.requestNetwork(request, callback, 60_000)
        } catch (e: Exception) {
            joinCallback = null
            finish(e.message ?: "Couldn't request the Wi-Fi network.")
        }
    }

    fun leave() {
        joinCallback?.let {
            try {
                cm.unregisterNetworkCallback(it)
            } catch (_: Exception) {
            }
        }
        joinCallback = null
        joinedNetwork = null
    }

    /**
     * Sockets created while bound use the Wi-Fi network; the binding is
     * stamped on each socket at creation, so unbinding afterwards keeps the
     * upstream socket on Wi-Fi while new sockets (the relay's server) stay on
     * the default route, which reaches this phone's own Wi-Fi Direct clients.
     */
    fun bindProcessToWifi(): Boolean {
        val network = joinedNetwork ?: anyWifiNetwork ?: return false
        return cm.bindProcessToNetwork(network)
    }

    fun unbindProcess() {
        cm.bindProcessToNetwork(null)
    }

    // ---- Hosting a network (Wi-Fi Direct group) -----------------------------

    @SuppressLint("MissingPermission") // Dart requests NEARBY_WIFI_DEVICES / location first.
    fun createGroup(name: String, passphrase: String, done: (Map<String, Any>?, String?) -> Unit) {
        val manager = p2p ?: return done(null, "This phone doesn't support Wi-Fi Direct.")
        val channel = p2pChannel ?: manager.initialize(context, Looper.getMainLooper(), null)
            .also { p2pChannel = it }

        val create = {
            val config = WifiP2pConfig.Builder()
                .setNetworkName(name)
                .setPassphrase(passphrase)
                .enablePersistentMode(false)
                .setGroupOperatingBand(WifiP2pConfig.GROUP_OWNER_BAND_AUTO)
                .build()
            manager.createGroup(channel, config, object : WifiP2pManager.ActionListener {
                override fun onSuccess() = awaitGroupInfo(manager, channel, 0, done)
                override fun onFailure(reason: Int) = done(
                    null,
                    "Couldn't create the network (${p2pReason(reason)}). Make sure Wi-Fi " +
                        "is on" + (if (Build.VERSION.SDK_INT < 33) " and Location is on." else ".")
                )
            })
        }
        // Clear a group left over from an earlier session first.
        manager.removeGroup(channel, object : WifiP2pManager.ActionListener {
            override fun onSuccess() {
                main.postDelayed({ create() }, 300)
            }

            override fun onFailure(reason: Int) {
                create()
            }
        })
    }

    @SuppressLint("MissingPermission")
    private fun awaitGroupInfo(
        manager: WifiP2pManager,
        channel: WifiP2pManager.Channel,
        attempt: Int,
        done: (Map<String, Any>?, String?) -> Unit,
    ) {
        manager.requestGroupInfo(channel) { group ->
            if (group != null && group.isGroupOwner) {
                val iface = group.`interface`
                done(
                    mapOf(
                        "ssid" to group.networkName,
                        "password" to (group.passphrase ?: ""),
                        "ip" to (ipv4Of(iface) ?: "192.168.49.1"),
                        "interface" to (iface ?: ""),
                        "frequency" to group.frequency,
                    ),
                    null
                )
            } else if (attempt < 15) {
                main.postDelayed({ awaitGroupInfo(manager, channel, attempt + 1, done) }, 300)
            } else {
                done(null, "The network didn't start in time. Try again.")
            }
        }
    }

    fun removeGroup(done: () -> Unit) {
        val manager = p2p
        val channel = p2pChannel
        if (manager == null || channel == null) return done()
        manager.removeGroup(channel, object : WifiP2pManager.ActionListener {
            override fun onSuccess() = done()
            override fun onFailure(reason: Int) = done()
        })
    }

    private fun ipv4Of(iface: String?): String? {
        if (iface.isNullOrEmpty()) return null
        return try {
            NetworkInterface.getByName(iface)?.inetAddresses?.toList()
                ?.firstOrNull { it is Inet4Address }?.hostAddress
        } catch (_: Exception) {
            null
        }
    }

    private fun p2pReason(reason: Int) = when (reason) {
        WifiP2pManager.P2P_UNSUPPORTED -> "Wi-Fi Direct unsupported"
        WifiP2pManager.BUSY -> "Wi-Fi is busy"
        WifiP2pManager.ERROR -> "internal error"
        else -> "code $reason"
    }
}
