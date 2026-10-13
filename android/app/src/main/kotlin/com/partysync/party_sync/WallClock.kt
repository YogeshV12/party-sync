package com.partysync.party_sync

/**
 * Wall-clock microseconds, matching Dart's DateTime.now() so both sides of the
 * platform channel share one timebase.
 *
 * System.currentTimeMillis() only has millisecond resolution, so we pin the
 * offset between the monotonic clock and the wall clock at the instant the
 * millisecond ticks over, which is accurate to well under a microsecond.
 * Recalibrated every few seconds to follow NTP adjustments.
 */
object WallClock {
    @Volatile private var offsetNanos = 0L
    @Volatile private var calibratedAt = Long.MIN_VALUE

    @Synchronized
    fun calibrate() {
        val start = System.currentTimeMillis()
        val deadline = System.nanoTime() + 3_000_000L
        var mono: Long
        var now: Long
        do {
            mono = System.nanoTime()
            now = System.currentTimeMillis()
        } while (now == start && mono < deadline)
        offsetNanos = now * 1_000_000L - mono
        calibratedAt = mono
    }

    fun monoToWallUs(monoNanos: Long): Long {
        if (System.nanoTime() - calibratedAt > 5_000_000_000L) calibrate()
        return (monoNanos + offsetNanos) / 1000L
    }

    fun nowUs(): Long = monoToWallUs(System.nanoTime())
}
