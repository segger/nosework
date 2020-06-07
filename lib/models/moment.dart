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
