package com.partysync.party_sync

import android.annotation.SuppressLint
import android.media.AudioFormat
import android.media.AudioRecord
import android.media.AudioTimestamp
import android.media.MediaRecorder
import android.os.Process
import android.util.Log
import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * Records the host's mic in fixed frames and stamps each frame with the wall
 * time its first sample was captured (from AudioRecord's own timestamps).
 *
 * Frames are delivered as [captureWallUs i64][sampleIndex i64][pcm16 LE...].
 */
class AudioCapture(private val onFrame: (ByteArray) -> Unit) {
    @Volatile private var running = false
    private var thread: Thread? = null

    @SuppressLint("MissingPermission") // Dart requests RECORD_AUDIO first.
    fun start(sampleRate: Int, frameSamples: Int, voiceProcessing: Boolean) {
        // VOICE_COMMUNICATION turns on the platform's echo/noise processing.
        val source = if (voiceProcessing) MediaRecorder.AudioSource.VOICE_COMMUNICATION
        else MediaRecorder.AudioSource.MIC
        val minBuf = AudioRecord.getMinBufferSize(
            sampleRate, AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT
        )
        val record = AudioRecord(
            source, sampleRate, AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT,
            maxOf(minBuf, frameSamples * 2 * 8)
        )
        if (record.state != AudioRecord.STATE_INITIALIZED) {
            record.release()
            throw IllegalStateException("The microphone is unavailable or in use by another app.")
        }
        running = true
        thread = Thread({ loop(record, sampleRate, frameSamples) }, "ps-capture").also { it.start() }
    }

    private fun loop(record: AudioRecord, sampleRate: Int, frameSamples: Int) {
        Process.setThreadPriority(Process.THREAD_PRIORITY_URGENT_AUDIO)
        val pcm = ShortArray(frameSamples)
        val ts = AudioTimestamp()
        var framesRead = 0L
        try {
            record.startRecording()
            while (running) {
                var off = 0
                while (off < frameSamples && running) {
                    val r = record.read(pcm, off, frameSamples - off)
                    if (r < 0) throw IllegalStateException("AudioRecord.read failed: $r")
                    off += r
                }
                if (!running) break

                val captureUs =
                    if (record.getTimestamp(ts, AudioTimestamp.TIMEBASE_MONOTONIC) == AudioRecord.SUCCESS) {
                        WallClock.monoToWallUs(
                            ts.nanoTime + (framesRead - ts.framePosition) * 1_000_000_000L / sampleRate
                        )
                    } else {
                        WallClock.nowUs() - frameSamples * 1_000_000L / sampleRate
                    }

                val out = ByteBuffer.allocate(16 + frameSamples * 2).order(ByteOrder.LITTLE_ENDIAN)
                out.putLong(captureUs)
                out.putLong(framesRead)
                out.asShortBuffer().put(pcm, 0, frameSamples)
                onFrame(out.array())
                framesRead += frameSamples
            }
        } catch (e: Exception) {
            Log.e(TAG, "Capture stopped", e)
        } finally {
            try {
                record.stop()
            } catch (_: Exception) {
            }
            record.release()
        }
    }

    fun stop() {
        running = false
        thread?.join(500)
        thread = null
    }

    private companion object {
        const val TAG = "PartySyncCapture"
    }
}
