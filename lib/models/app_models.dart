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
  int id;
  String name;
  String type;
  int maxTime;

  Moment({ this.id, this.name, this.type, this.maxTime });

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
      id: dbMap['id'],
      name: dbMap['name'],
      type: dbMap['type'],
      maxTime: dbMap['maxTime'],
    );
  }
}

class Participant {
  int id;
  String name;
  String dog;

  Participant({ this.id, this.name, this.dog });

  static Participant of(Map<String, dynamic> dbMap) {
    return Participant(
      id: dbMap['id'],
      name: dbMap['name'],
      dog: dbMap['dog'],
    );
  }
}

class Protocol {
  int participantId;
  bool sse;
  int points;
  int errors;
  int time;

  Protocol({ this.participantId, this.sse, this.points, this.errors, this.time });

  static Protocol of(Map<String, dynamic> dbMap) {
    return Protocol(
      participantId: dbMap['participantId'],
      sse: dbMap['sse'] == 1,
      points: dbMap['points'],
      errors: dbMap['errors'],
      time: dbMap['time'],
    );
  }
}