import 'package:nosework/models/app_models.dart';

import 'db_constants.dart';

class DBMockData {

  DBMockData();

  List<String> participants() {
    List<Participant> participants = List<Participant>();
    participants.add(Participant(name: 'Ulrica', dog: 'Fiddeli'));
    participants.add(Participant(name: 'Annika', dog: 'Maja'));
    participants.add(Participant(name: 'Mia', dog: 'Flora'));
    participants.add(Participant(name: 'Katja', dog: 'Max'));
    participants.add(Participant(name: 'Viveca', dog: 'Alexi'));
    participants.add(Participant(name: 'Angelica', dog: 'Zlato'));
    participants.add(Participant(name: 'Benita', dog: 'Itzi'));
    participants.add(Participant(name: 'Carina', dog: 'Buttran'));
    participants.add(Participant(name: 'Sandra', dog: 'Bosse'));
    participants.add(Participant(name: 'Heidi', dog: 'Foxy'));
    participants.add(Participant(name: 'Martina', dog: 'Biffen'));
    participants.add(Participant(name: 'Susanne', dog: 'Caesar'));
    participants.add(Participant(name: 'Mia', dog: 'Oprah'));
    participants.add(Participant(name: 'Anita', dog: 'Cookie'));
    participants.add(Participant(name: 'Anki', dog: 'Sally'));
    participants.add(Participant(name: 'Karin', dog: 'Astrid'));
    participants.add(Participant(name: 'Gitte', dog: 'Dante'));
    participants.add(Participant(name: 'Inger', dog: 'Valle'));
    List<String> ret = List<String>();
    participants.forEach((participant) {
      ret.add("INSERT INTO ${DBConstants.PARTICIPANT_TABLE}(name, dog) VALUES ('${participant.name}','${participant.dog}')");
    });
    return ret;
  }

  Protocol protocol(int id, int minutes, int seconds, int milliseconds, int points, int errors, bool sse) {
    return Protocol(participantId: id, time: Duration(minutes: minutes, seconds: seconds, milliseconds: milliseconds).inMilliseconds, points: points, errors: errors, sse: sse);
  }

  List<Protocol> moment1() {
    List<Protocol> protocols = List<Protocol>();
    protocols.add(protocol(1, 0, 22, 60, 25, 0, false));
    protocols.add(protocol(2, 0, 26, 93, 25, 0, false));
    protocols.add(protocol(3, 0, 28, 19, 25, 0, false));
    protocols.add(protocol(4, 0, 33, 84, 25, 0, false));
    protocols.add(protocol(5, 0, 36, 47, 25, 0, false));
    protocols.add(protocol(6, 0, 43, 75, 25, 0, false));
    protocols.add(protocol(7, 0, 58, 94, 25, 0, false));
    protocols.add(protocol(8, 1, 6, 97, 25, 0, false));
    protocols.add(protocol(9, 1, 25, 9, 25, 0, false));
    protocols.add(protocol(10, 0, 41, 39, 25, 1, false));
    protocols.add(protocol(11, 1, 30, 0, 0, 2, false));
    protocols.add(protocol(12, 1, 30, 0, 0, 2, false));
    protocols.add(protocol(13, 1, 30, 0, 0, 2, false));
    protocols.add(protocol(14, 1, 30, 0, 0, 2, false));
    protocols.add(protocol(15, 1, 30, 0, 0, 2, false));
    protocols.add(protocol(16, 1, 30, 0, 0, 2, false));
    protocols.add(protocol(17, 1, 30, 0, 0, 2, false));
    return protocols;
  }

  List<Protocol> moment2() {
    List<Protocol> protocols = List<Protocol>();
    protocols.add(protocol(15, 0, 14, 19, 25, 0, false));
    protocols.add(protocol(11, 0, 14, 66, 25, 0, false));
    protocols.add(protocol(6, 0, 14, 82, 25, 0, false));
    protocols.add(protocol(13, 0, 15, 25, 25, 0, false));
    protocols.add(protocol(8, 0, 16, 22, 25, 0, false));
    protocols.add(protocol(12, 0, 27, 81, 25, 0, false));
    protocols.add(protocol(9, 0, 29, 32, 25, 0, false));
    protocols.add(protocol(5, 0, 30, 50, 25, 0, false));
    protocols.add(protocol(1, 0, 38, 3, 25, 0, false));
    protocols.add(protocol(14, 0, 39, 75, 25, 0, false));
    protocols.add(protocol(3, 0, 43, 12, 25, 0, false));
    protocols.add(protocol(4, 0, 57, 19, 25, 0, false));
    protocols.add(protocol(2, 1, 12, 37, 25, 0, false));
    protocols.add(protocol(17, 2, 0, 0, 0, 0, false));
    protocols.add(protocol(7, 2, 0, 0, 0, 0, false));
    protocols.add(protocol(16, 2, 0, 0, 0, 2, false));
    protocols.add(protocol(10, 2, 0, 0, 0, 2, false));
    protocols.add(protocol(18, 2, 0, 0, 0, 2, false));
    return protocols;

  }

  List<String> protocols(int momentId) {
    List<Protocol> protocols = List<Protocol>();
    if (momentId == 1) {
      protocols = moment1();
    } else if (momentId == 2) {
      protocols = moment2();
    }
    
    List<String> ret = List<String>();
    protocols.forEach((p) {
      int sse = p.sse ? 1 : 0;
      ret.add("INSERT INTO ${DBConstants.PROTOCOL_TABLE}(momentId, participantId, sse, points, errors, time, comment) "
      "VALUES ($momentId, ${p.participantId}, $sse, ${p.points}, ${p.errors}, ${p.time}, '')");
    });
    return ret;
  }
}