import 'package:nosework/models/app_models.dart';
import 'package:nosework/providers/db_repository.dart';

class ResultService {
  final DBRepository repository = DBRepository();

  Future<List<Result>> getMomentResult(int momentId) async {
    List<Protocol> protocols = await repository.getProtocols(momentId);
    List<Participant> participants = await repository.getParticipants();
    
    List<Protocol> approved = protocols.where((p) => p.points > 0).toList();

    approved.sort((p1, p2) => _compare(p1, p2));
    int placement = 1;
    int tp = 20;
    List<Result> result = approved.map((p) => Result(
      placement: _placement(placement++),
      participant: _participant(participants, p.participantId),
      tournamentPoints: _tournamentPoints(tp--),
      protocol: p,
    )).toList();

    List<Protocol> notApproved = protocols.where((p) => p.points == 0).toList();
    notApproved.sort((p1, p2) => _compare(p1, p2));
    result.addAll(notApproved.map((p) => Result(
      placement: p.errors > 0 ? "IG" : "GK",
      participant: _participant(participants, p.participantId),
      tournamentPoints: p.errors > 0 ? 3 : 10,
      protocol: p,
    )).toList());
    return result;
  }

  _compare(Protocol p1, Protocol p2) {
    if (p1.errors > p2.errors) {
      return 1;
    } else if (p2.errors > p1.errors) {
      return -1;
    } else {
      if (p1.time > p2.time) {
        return 1;
      } else if (p2.time > p1.time) {
        return -1;
      } else {
        return 0;
      }
    }
  }

  String _placement(int placement) {
    if (placement <= 10) {
      return placement.toString();
    } else {
      return "GK";
    }
  }

  String _participant(List<Participant> participants, int participantId) {
    Participant participant = participants.firstWhere((par) => par.id == participantId);
    return "${participant.name} & ${participant.dog}";
  }

  int _tournamentPoints(int tp) {
    if (tp >= 10) {
      return tp;
    } else {
      return 10;
    }
  }
}