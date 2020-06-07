import 'package:nosework/utils/utils.dart';

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