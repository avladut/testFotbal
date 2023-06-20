import 'package:fotbal_project/data/models/team_dto.dart';

class MatchDTO {
  MatchDTO({
    required this.homeTeam,
    required this.awayTeam,
    required this.winningTeam,
  });

  final String? winningTeam;
  final TeamDTO homeTeam;
  final TeamDTO awayTeam;

  factory MatchDTO.fromJson(Map<String, dynamic> json) => MatchDTO(
        winningTeam: json['score']['winner'],
        homeTeam: TeamDTO.fromJson(json['homeTeam']),
        awayTeam: TeamDTO.fromJson(json['awayTeam']),
      );
}
