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