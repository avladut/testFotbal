import 'package:fotbal_project/data/models/match_dto.dart';
import 'package:fotbal_project/domain/models/fotbal_match.dart';
import 'team_from_teamdto.dart';

extension MatchFromMatchDTO on MatchDTO {
  FotbalMatch toMatch() {
    return FotbalMatch(
        homeTeam: homeTeam.toTeam(),
        awayTeam: awayTeam.toTeam(),
        winningTeam: winningTeam);
  }
}
