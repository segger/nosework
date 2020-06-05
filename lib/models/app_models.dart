class Tournament {
  String name;

  Tournament({ this.name });

  static Tournament of(Map<String, dynamic> dbMap) {
    return Tournament(
      name: dbMap['name']
    );
  }
}