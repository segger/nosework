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