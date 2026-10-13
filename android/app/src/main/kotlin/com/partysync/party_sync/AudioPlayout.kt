package com.partysync.party_sync

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioDeviceInfo
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTimestamp
import android.media.AudioTrack
import android.os.Process
import android.util.Log

/**
 * Plays the [PlayoutBuffer] through an AudioTrack, asking the buffer for the
 * audio that belongs at the exact moment each chunk will leave the speaker.
 *
 * AudioTrack.getTimestamp() reports when a written frame is presented,
 * including Bluetooth delay on devices whose Bluetooth stack reports it. The
 * user's lag correction covers speakers that under-report.
 */
class AudioPlayout(private val context: Context) {
    val buffer = PlayoutBuffer()

    /** Positive = this speaker is late, so pull audio from further ahead. */
    @Volatile var userOffsetUs = 0L

    @Volatile var outputLatencyUs = 0L
        private set

    @Volatile private var running = false
    @Volatile private var track: AudioTrack? = null
    private var thread: Thread? = null

    fun start(sampleRate: Int, frameSamples: Int) {
        stop()
        buffer.configure(sampleRate, frameSamples)
        val am = context.getSystemService(AudioManager::class.java)
        val outRate = am.getProperty(AudioManager.PROPERTY_OUTPUT_SAMPLE_RATE)?.toIntOrNull() ?: 48000
        val minBuf = AudioTrack.getMinBufferSize(
            outRate, AudioFormat.CHANNEL_OUT_MONO, AudioFormat.ENCODING_PCM_16BIT
        )
        val t = AudioTrack.Builder()
            .setAudioAttributes(
                AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_MEDIA)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                    .build()
            )
            .setAudioFormat(
                AudioFormat.Builder()
                    .setSampleRate(outRate)
                    .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                    .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                    .build()
            )
            .setTransferMode(AudioTrack.MODE_STREAM)
            .setBufferSizeInBytes(maxOf(minBuf, outRate / 25 * 2)) // at least 40 ms
            .build()
        track = t
        running = true
        thread = Thread({ loop(t, outRate) }, "ps-playout").also { it.start() }
    }

    private fun loop(t: AudioTrack, outRate: Int) {
        Process.setThreadPriority(Process.THREAD_PRIORITY_URGENT_AUDIO)
        val chunk = outRate / 100 // 10 ms
        val pcm = ShortArray(chunk)
        val ts = AudioTimestamp()
        var written = 0L
        try {
            t.play()
            while (running) {
                val nowUs = WallClock.nowUs()
                // When will the next frame we write actually be heard?
                val presentUs = if (t.getTimestamp(ts) && ts.framePosition > 0) {
                    WallClock.monoToWallUs(ts.nanoTime) +
                        (written - ts.framePosition) * 1_000_000L / outRate
                } else {
                    nowUs + (written - t.playbackHeadPosition.toLong()) * 1_000_000L / outRate +
                        FALLBACK_LATENCY_US
                }
                outputLatencyUs = presentUs - nowUs
                buffer.render(pcm, chunk, outRate, presentUs + userOffsetUs)
                val w = t.write(pcm, 0, chunk) // blocks, which paces this loop
                if (w < 0) throw IllegalStateException("AudioTrack.write failed: $w")
                written += w
            }
        } catch (e: Exception) {
            Log.e(TAG, "Playback stopped", e)
        } finally {
            try {
                t.stop()
            } catch (_: Exception) {
            }
            t.release()
        }
    }

    fun stop() {
        running = false
        thread?.join(500)
        thread = null
        track = null
    }

    fun stats(): Map<String, Any> {
        val (route, kind) = routeInfo()
        val ms = 1000.0 / buffer.sampleRate
        return mapOf(
            "route" to route,
            "routeKind" to kind,
            "outputLatencyMs" to outputLatencyUs / 1000.0,
            "bufferedMs" to buffer.bufferedMs,
            "syncErrorMs" to buffer.syncErrorMs,
            "lostMs" to buffer.lostSamples * ms,
            "starvedMs" to buffer.starvedSamples * ms,
            "resyncs" to buffer.resyncs,
        )
    }

    private fun routeInfo(): Pair<String, String> {
        val device = track?.routedDevice ?: return "" to ""
        val kind = when (device.type) {
            AudioDeviceInfo.TYPE_BLUETOOTH_A2DP -> "bluetooth"
            AudioDeviceInfo.TYPE_BLE_HEADSET,
            AudioDeviceInfo.TYPE_BLE_SPEAKER,
            AudioDeviceInfo.TYPE_BLE_BROADCAST -> "bluetooth-le"
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
            AudioDeviceInfo.TYPE_BUILTIN_EARPIECE -> "speaker"
            AudioDeviceInfo.TYPE_WIRED_HEADSET,
            AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
            AudioDeviceInfo.TYPE_LINE_ANALOG,
            AudioDeviceInfo.TYPE_AUX_LINE -> "wired"
            AudioDeviceInfo.TYPE_USB_DEVICE,
            AudioDeviceInfo.TYPE_USB_HEADSET,
            AudioDeviceInfo.TYPE_USB_ACCESSORY -> "usb"
            else -> "other"
        }
        val name = when (kind) {
            "speaker" -> "Phone speaker"
            else -> device.productName?.toString()?.takeIf { it.isNotBlank() } ?: "Speaker"
        }
        return name to kind
    }

    private companion object {
        const val TAG = "PartySyncPlayout"
        const val FALLBACK_LATENCY_US = 50_000L
    }
}
