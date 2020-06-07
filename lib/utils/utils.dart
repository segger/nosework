class Utils {

  static String toMinSec(int milliseconds, {String delimeter = ":"}) {
    Duration duration = Duration(milliseconds: milliseconds);
    return [duration.inMinutes, duration.inSeconds]
          .map((dur) => dur.remainder(60).toString().padLeft(2, '0')).join(delimeter);
  }

  static String toMinSecMillis(int milliseconds, {String delimeter = ":"}) {
    Duration duration = Duration(milliseconds: milliseconds);
    String minSec = toMinSec(milliseconds, delimeter: delimeter);
    String millis = duration.inMilliseconds.remainder(100).toString().padLeft(2, '0');
    return "$minSec.$millis";
  }

  static int toMillis(String time) {
    try {
      var splitted = time.split(".");
      Duration duration = Duration(
          minutes: int.parse(splitted[0]),
          seconds: int.parse(splitted[1]),
          milliseconds: int.parse(splitted[2])
      );
      return duration.inMilliseconds;
    } catch (e) {
      return null;
    }
  }

  static String momentType(String type) {
    switch(type) {
      case 'INDOOR': return 'Inomhussök';
      case 'OUTDOOR': return 'Utomhussök';
      case 'VEHICLE': return 'Fordonssök';
      case 'CONTAINER': return 'Behållarsök';
    }
    return '';
  }
}