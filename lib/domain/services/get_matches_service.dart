import 'package:fotbal_project/data/api.dart';
import 'package:fotbal_project/data/models/match_dto.dart';
import 'package:fotbal_project/data/models/team_dto.dart';
import 'package:fotbal_project/domain/extensions/match_from_matchdto.dart';
import 'package:fotbal_project/domain/models/fotbal_match.dart';

class GetMatchesService {
  GetMatchesService(this.api);
  final Api api;

  Future<List<FotbalMatch>> getMatches() async {
    try {
      List<MatchDTO> matchesDTO = await api.getRecentMatches();
      List<FotbalMatch> matches = matchesDTO.map((e) => e.toMatch()).toList();
      return matches;
    } catch (e) {
      //should do some more errror handling
      rethrow;
    }
  }
}
