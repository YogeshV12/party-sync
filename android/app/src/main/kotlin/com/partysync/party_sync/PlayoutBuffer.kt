package com.partysync.party_sync

import java.util.Arrays
import kotlin.math.abs
import kotlin.math.floor
import kotlin.math.roundToInt

/**
 * Jitter buffer that plays every packet at its scheduled wall-clock time.
 *
 * Packets carry a global sample index and the local time their first sample
 * must be heard. For each output chunk we work out which source sample should
 * be audible at that moment and nudge playback speed (±0.5%, inaudible) to
 * converge on it, so clock drift and sync updates never click. Errors over
 * 40 ms (new stream, long gap) jump straight to the right position.
 *
 * Mirrored in ios/Runner/PlayoutBuffer.swift; keep the two in step.
 */
class PlayoutBuffer {
    private val lock = Any()
    private val ringSize = 256
    private var srcRate = 16000
    private var frame = 320
    private var slotFirst = LongArray(ringSize) { -1L }
    private var samples = ShortArray(ringSize * frame)

    private var refFirst = -1L
    private var refPlayUs = 0L
    private var newestEnd = -1L
    private var cursor = 0.0
    private var cursorValid = false
    private var errFiltered = 0.0

    @Volatile var bufferedMs = 0.0
        private set
    @Volatile var syncErrorMs = 0.0
        private set
    @Volatile var lostSamples = 0L
        private set
    @Volatile var starvedSamples = 0L
        private set
    @Volatile var resyncs = 0
        private set

    val sampleRate: Int get() = srcRate

    fun configure(sampleRate: Int, frameSamples: Int) {
        synchronized(lock) {
            srcRate = sampleRate
            frame = frameSamples
            slotFirst = LongArray(ringSize) { -1L }
            samples = ShortArray(ringSize * frame)
            refFirst = -1L
            newestEnd = -1L
            cursorValid = false
            errFiltered = 0.0
            bufferedMs = 0.0
            syncErrorMs = 0.0
            lostSamples = 0
            starvedSamples = 0
            resyncs = 0
        }
    }

    fun push(first: Long, playAtUs: Long, pcm: ShortArray, count: Int) {
        if (first < 0) return
        synchronized(lock) {
            val slot = ((first / frame) % ringSize).toInt()
            val n = minOf(count, frame)
            System.arraycopy(pcm, 0, samples, slot * frame, n)
            if (n < frame) Arrays.fill(samples, slot * frame + n, (slot + 1) * frame, 0)
            slotFirst[slot] = first
            if (first >= refFirst) {
                refFirst = first
                refPlayUs = playAtUs
            }
            if (first + n > newestEnd) newestEnd = first + n
        }
    }

    /** Fills [out] with [n] samples at [outRate] that will be heard starting at [startUs]. */
    fun render(out: ShortArray, n: Int, outRate: Int, startUs: Long) {
        synchronized(lock) {
            if (refFirst < 0) {
                Arrays.fill(out, 0, n, 0)
                return
            }
            val ideal = refFirst + (startUs - refPlayUs) * srcRate / 1e6
            var err = ideal - cursor
            if (!cursorValid || abs(err) > srcRate * 0.04) {
                if (cursorValid) resyncs++
                cursor = ideal
                cursorValid = true
                errFiltered = 0.0
                err = 0.0
            }
            errFiltered += (err - errFiltered) * 0.1
            val correction = (errFiltered / srcRate / 0.25).coerceIn(-0.005, 0.005)
            val step = srcRate.toDouble() / outRate * (1.0 + correction)

            var c = cursor
            for (k in 0 until n) {
                val i0 = floor(c).toLong()
                val frac = c - i0
                val s0 = sampleAt(i0)
                if (s0 == MISSING) {
                    if (i0 < newestEnd) lostSamples++ else starvedSamples++
                    out[k] = 0
                } else {
                    val s1 = sampleAt(i0 + 1).let { if (it == MISSING) s0 else it }
                    out[k] = (s0 + (s1 - s0) * frac).roundToInt().toShort()
                }
                c += step
            }
            cursor = c
            bufferedMs = (newestEnd - cursor) * 1000.0 / srcRate
            syncErrorMs = errFiltered * 1000.0 / srcRate
        }
    }

    private fun sampleAt(i: Long): Int {
        if (i < 0) return MISSING
        val slot = ((i / frame) % ringSize).toInt()
        val first = slotFirst[slot]
        val offset = i - first
        if (first < 0 || offset < 0 || offset >= frame) return MISSING
        return samples[slot * frame + offset.toInt()].toInt()
    }

    private companion object {
        const val MISSING = Int.MIN_VALUE
    }
}
