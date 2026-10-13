import Darwin

/// Wall-clock microseconds, matching Dart's DateTime.now() so both sides of
/// the platform channel share one timebase, plus conversion from the mach
/// host time that Core Audio timestamps use.
enum WallClock {
  private static let ticksToNanos: Double = {
    var info = mach_timebase_info_data_t()
    mach_timebase_info(&info)
    return Double(info.numer) / Double(info.denom)
  }()

  /// Touch the lazily initialised constant off the audio thread.
  static func prime() { _ = ticksToNanos }

  static func nowUs() -> Int64 {
    Int64(clock_gettime_nsec_np(CLOCK_REALTIME) / 1000)
  }

  /// Wall-clock microseconds for a mach host time (e.g. AudioTimeStamp.mHostTime).
  static func wallUs(fromHostTime hostTime: UInt64) -> Int64 {
    let nowHost = mach_absolute_time()
    let nowWall = nowUs()
    let deltaNanos = (Double(nowHost) - Double(hostTime)) * ticksToNanos
    return nowWall - Int64(deltaNanos / 1000)
  }
}
