import 'package:fotbal_project/data/models/match_dto.dart';

abstract class Api {
  Future<List<MatchDTO>> getRecentMatches();
}
