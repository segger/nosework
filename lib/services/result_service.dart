import 'package:nosework/models/app_models.dart';
import 'package:nosework/providers/db_repository.dart';

class ResultService {
  final DBRepository repository = DBRepository();

  Future<List<Protocol>> getMomentResult(int momentId) async {
    return repository.getProtocols(momentId);
  }
}