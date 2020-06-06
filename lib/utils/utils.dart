class Utils {

  static String toMinSec(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    return [duration.inMinutes, duration.inSeconds]
          .map((dur) => dur.remainder(60).toString().padLeft(2, '0')).join(':');
  }

  static String toMinSecMillis(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    String minSec = toMinSec(milliseconds);
    String millis = duration.inMilliseconds.remainder(100).toString().padLeft(2, '0');
    return "$minSec.$millis";
  }
}