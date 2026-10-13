package com.partysync.party_sync

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import kotlin.math.abs

class PlayoutBufferTest {
    private val rate = 16000
    private val frame = 320
    private val t0 = 1_000_000_000L
    private val wrap = 16384

    /** Each sample's value is its own index, so output reveals what was played. */
    private fun packet(k: Int) = ShortArray(frame) { ((k * frame + it) % wrap).toShort() }

    private fun pushRange(b: PlayoutBuffer, from: Int, until: Int, shiftUs: Long = 0, skip: Set<Int> = emptySet()) {
        for (k in from until until) {
            if (k in skip) continue
            b.push(k.toLong() * frame, t0 + k * 20_000L + shiftUs, packet(k), frame)
        }
    }

    private fun circularDistance(a: Int, b: Int): Int {
        val d = abs(a - b) % wrap
        return minOf(d, wrap - d)
    }

    @Test
    fun playsTheSampleScheduledForEachInstant() {
        val b = PlayoutBuffer().apply { configure(rate, frame) }
        pushRange(b, 0, 50)
        val out = ShortArray(160)
        b.render(out, 160, rate, t0 + 100_000L) // 100 ms in → sample 1600
        assertEquals(1600, out[0].toInt())
        assertEquals(1759, out[159].toInt())
        b.render(out, 160, rate, t0 + 110_000L)
        assertEquals(1760, out[0].toInt())
        assertEquals(0, b.resyncs)
    }

    @Test
    fun resamplesToTheDeviceRate() {
        val b = PlayoutBuffer().apply { configure(rate, frame) }
        pushRange(b, 0, 50)
        val out = ShortArray(480)
        b.render(out, 480, 48000, t0 + 100_000L)
        assertEquals(1600, out[0].toInt())
        assertEquals(1601, out[3].toInt())
        assertEquals(1759, out[477].toInt())
    }

    @Test
    fun smallTimingChangesAreAbsorbedSmoothly() {
        val b = PlayoutBuffer().apply { configure(rate, frame) }
        pushRange(b, 0, 10)
        val out = ShortArray(160)
        var t = t0 + 100_000L
        b.render(out, 160, rate, t)
        // The clock estimate moves by 3 ms: later packets are scheduled 3 ms later.
        pushRange(b, 10, 260, shiftUs = 3_000)
        var maxStep = 0
        var previousLast = out[159].toInt()
        repeat(400) {
            t += 10_000L
            b.render(out, 160, rate, t)
            // Consecutive output samples never jump: the correction is a tiny speed change.
            maxStep = maxOf(maxStep, circularDistance(out[0].toInt(), previousLast))
            previousLast = out[159].toInt()
        }
        val expected = ((t - t0 - 3_000L) * rate / 1_000_000L).toInt() % wrap
        assertTrue("ended at ${out[0]}, expected $expected", circularDistance(out[0].toInt(), expected) <= 2)
        assertTrue("step $maxStep", maxStep <= 2)
        assertEquals(0, b.resyncs)
    }

    @Test
    fun largeJumpsResyncImmediately() {
        val b = PlayoutBuffer().apply { configure(rate, frame) }
        pushRange(b, 0, 10)
        val out = ShortArray(160)
        b.render(out, 160, rate, t0 + 100_000L)
        pushRange(b, 10, 60, shiftUs = 100_000) // 100 ms later: e.g. host raised the delay
        b.render(out, 160, rate, t0 + 400_000L)
        assertEquals(1, b.resyncs)
        assertEquals(((400_000L - 100_000L) * rate / 1_000_000L).toInt(), out[0].toInt())
    }

    @Test
    fun missingPacketsPlaySilenceAndAreCounted() {
        val b = PlayoutBuffer().apply { configure(rate, frame) }
        pushRange(b, 0, 30, skip = setOf(10))
        val out = ShortArray(160)
        b.render(out, 160, rate, t0 + 200_000L) // packet 10 covers 200..220 ms
        assertTrue(out.all { it.toInt() == 0 })
        b.render(out, 160, rate, t0 + 210_000L)
        assertTrue(out.all { it.toInt() == 0 })
        assertTrue(b.lostSamples >= 320)
        b.render(out, 160, rate, t0 + 220_000L)
        assertEquals(11 * frame, out[0].toInt())
    }
}
