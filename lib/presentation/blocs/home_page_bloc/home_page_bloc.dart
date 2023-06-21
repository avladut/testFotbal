import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotbal_project/domain/models/fotbal_match.dart';
import 'package:fotbal_project/domain/models/team.dart';
import 'package:fotbal_project/domain/services/get_matches_service.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_events.dart';

import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(this.service) : super(HomePageStateInitial()) {
    on<GetWinningTeam>((event, emit) {
      getWinningTeam();
    });
  }

  GetMatchesService service;

  void getWinningTeam() {
    emit(HomePageStateLoading());
    try {
      service.getMatches().then((matches) async {
        if (matches.isEmpty) {
          emit(HomePageStateLoadingError('there were no matches to be found'));
        } else {
          final Team? winner = await _getTeamWithMostWins(matches);
          emit(HomePageStateDataLoadedSuccess(winner));
        }
      }).onError((error, stackTrace) {
        emit(
            HomePageStateLoadingError('something went wrong with the request'));
      });
    } catch (e) {
      emit(HomePageStateLoadingError('something went wrong'));
    }
  }

//spagetti code, I should refactor this into something more elegant
  Future<Team?> _getTeamWithMostWins(List<FotbalMatch> matches) async {
    final Map<Team, int> matchesWon = {};
    for (FotbalMatch match in matches) {
      Team winningTeam;
      if (match.winningTeam == null || match.winningTeam!.isEmpty) {
        continue;
      } else if (match.winningTeam!.toLowerCase() == 'home_team') {
        winningTeam = match.homeTeam;
      } else {
        winningTeam = match.awayTeam;
      }

      if (matchesWon[winningTeam] != null) {
        matchesWon[winningTeam] = matchesWon[winningTeam]! + 1;
      } else {
        matchesWon[winningTeam] = 0;
      }
    }
    Team? winningTeam;
    if (matchesWon.isNotEmpty) {
      //simplistic view that doesn't handle the case where there are 2 teams with equal points
      int topValue = 0;
      matchesWon.forEach((key, value) {
        if (value > topValue) {
          winningTeam = key;
          topValue = value;
        }
      });
    }
    return winningTeam;
  }
}
