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