import 'package:equatable/equatable.dart';
import 'package:fotbal_project/domain/models/team.dart';

class FotbalMatch extends Equatable {
  const FotbalMatch({
    required this.homeTeam,
    required this.awayTeam,
    required this.winningTeam,
  });

//the winning team should be treated with an enum
//the match should also get an unique id
  final String? winningTeam;
  final Team homeTeam;
  final Team awayTeam;

  @override
  List<Object?> get props => [
        winningTeam,
        homeTeam,
        awayTeam,
      ];
}
