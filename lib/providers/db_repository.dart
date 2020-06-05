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
}