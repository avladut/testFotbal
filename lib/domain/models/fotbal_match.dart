import 'package:fotbal_project/data/models/team_dto.dart';
import 'package:fotbal_project/domain/models/team.dart';

class FotbalMatch {
  FotbalMatch({
    required this.homeTeam,
    required this.awayTeam,
    required this.winningTeam,
  });

//the winning team should be treated with an enum
  final String? winningTeam;
  final Team homeTeam;
  final Team awayTeam;
}
