class Tournament {
  int id;
  String name;

  Tournament({ this.id, this.name });

  static Tournament of(Map<String, dynamic> dbMap) {
    return Tournament(
      id: dbMap['id'],
      name: dbMap['name'],
    );
  }
}

class Contest {
  int id;
  String name;

  Contest({ this.id, this.name });

  static Contest of(Map<String, dynamic> dbMap) {
    return Contest(
      id: dbMap['id'],
      name: dbMap['name'],
    );
  }
}

class Moment {
  String name;
  String type;
  int maxTime;

  Moment({ this.name, this.type, this.maxTime });

  String printType() {
    switch(type) {
      case 'INDOOR': return 'Inomhussök';
      case 'OUTDOOR': return 'Utomhussök';
      case 'VEHICLE': return 'Fordonssök';
      case 'CONTAINER': return 'Behållarsök';
    }
    return '';
  }

  String printMaxTime() {
    Duration duration = Duration(milliseconds: maxTime);
    return [duration.inMinutes, duration.inSeconds]
          .map((dur) => dur.remainder(60).toString().padLeft(2, '0')).join(':');
  }

  static Moment of(Map<String, dynamic> dbMap) {
    return Moment(
      name: dbMap['name'],
      type: dbMap['type'],
      maxTime: dbMap['maxTime'],
    );
  }
}

class Participant {
  String name;
  String dog;

  Participant({ this.name, this.dog });

  static Participant of(Map<String, dynamic> dbMap) {
    return Participant(
      name: dbMap['name'],
      dog: dbMap['dog'],
    );
  }
}