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

class SearchAreaDto {
  bool found;
  int errors;
  int time;

  SearchAreaDto() : found = false, errors = 0, time = 0;
}