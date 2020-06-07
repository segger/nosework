import 'package:nosework/utils/utils.dart';

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

  Map<String, dynamic> toDbMap() {
    return {
      "id": id,
      "name": name,
      "dog": dog,
    };
  }
}

class Protocol {
  int id;
  int momentId;
  int participantId;
  bool sse = false;
  int points;
  int errors;
  int time;
  String comment;

  Protocol({ this.id, this.momentId, this.participantId, this.sse, this.points, this.errors, this.time, this.comment });

  static Protocol of(Map<String, dynamic> dbMap) {
    return Protocol(
      id: dbMap['id'],
      momentId: dbMap['momentId'],
      participantId: dbMap['participantId'],
      sse: dbMap['sse'] == 1,
      points: dbMap['points'],
      errors: dbMap['errors'],
      time: dbMap['time'],
      comment: dbMap['comment'],
    );
  }

  Map<String, dynamic> toDbMap() {
    return {
      "id": id,
      "momentId": momentId,
      "participantId": participantId,
      "sse": sse ? 1 : 0,
      "points": points,
      "errors": errors,
      "time": time,
      "comment": comment,
    };
  }
}

class Result {
  String placement;
  String participant;
  bool sse;
  int points;
  int errors;
  String time;
  int tournamentPoints;

  Result({ this.participant, this.placement, this.tournamentPoints, protocol }) :
    sse = protocol.sse,
    points = protocol.points,
    errors = protocol.errors,
    time = Utils.toMinSecMillis(protocol.time);
}

class SearchAreaDto {
  bool found;
  int errors;
  int time;

  SearchAreaDto() : found = false, errors = 0, time = 0;
}