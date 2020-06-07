import 'package:nosework/models/app_models.dart';

import 'package:nosework/providers/db_constants.dart';
import 'package:nosework/providers/db_provider.dart';

class DBRepository {
  final DBProvider provider = DBProvider.instance;

  Future<List<Tournament>> getTournamentList() async {
    List<Map<String, dynamic>> dbList = await provider.getAll(DBConstants.TOURNAMENT_TABLE);
    return dbList.isEmpty ? [] : List.generate(dbList.length, (i) {
      return Tournament.of(dbList[i]);
    });
  }

  Future<List<Contest>> getContestList(int tournamentId) async {
    List<Map<String, dynamic>> dbList = await provider.getAllWhere(DBConstants.CONTEST_TABLE, {"tournamentId": tournamentId });
    return dbList.isEmpty ? [] : List.generate(dbList.length, (i) {
      return Contest.of(dbList[i]);
    });
  }

  Future<List<Moment>> getMomentList(int contestId) async {
    List<Map<String, dynamic>> dbList = await provider.getAllWhere(DBConstants.MOMENT_TABLE, {"contestId": contestId});
    return dbList.isEmpty ? [] : List.generate(dbList.length, (i) {
      return Moment.of(dbList[i]);
    });
  }

  Future<List<Participant>> getParticipants() async {
    List<Map<String, dynamic>> dbList = await provider.getAll(DBConstants.PARTICIPANT_TABLE);
    return dbList.isEmpty ? [] : List.generate(dbList.length, (i) {
      return Participant.of(dbList[i]);
    });
  }

  Future<int> saveParticipant(Participant participant) async {
    if (participant.id == null) {
      return await provider.insert(DBConstants.PARTICIPANT_TABLE, participant.toDbMap());
    } else {
      return await provider.update(DBConstants.PARTICIPANT_TABLE, participant.toDbMap());
    }
  }

  Future<List<Protocol>> getProtocols(int momentId) async {
    List<Map<String, dynamic>> dbList = await provider.getAllWhere(DBConstants.PROTOCOL_TABLE, {"momentId":momentId});
    return dbList.isEmpty ? [] : List.generate(dbList.length, (i) {
      return Protocol.of(dbList[i]);
    });
  }

  Future<int> saveProtocol(Protocol protocol) async {
    if (protocol.id == null) {
      return await provider.insert(DBConstants.PROTOCOL_TABLE, protocol.toDbMap());
    } else {
      return await provider.update(DBConstants.PROTOCOL_TABLE, protocol.toDbMap());
    }
  }
}