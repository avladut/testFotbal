import 'package:flutter_test/flutter_test.dart';
import 'package:fotbal_project/domain/models/fotbal_match.dart';
import 'package:fotbal_project/domain/models/team.dart';
import 'package:fotbal_project/domain/services/get_matches_service.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_events.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_state.dart';
import 'package:mocktail/mocktail.dart';

class MockMatchesService extends Mock implements GetMatchesService {}

void main() {
  GetMatchesService mockService = MockMatchesService();
  HomePageBloc sut = HomePageBloc(mockService);

  const Team t1 = Team(id: '1', name: 'Alex united', tla: 'ALU');
  const Team t2 = Team(id: '2', name: 'BT united', tla: 'BT');
  const Team t3 = Team(id: '3', name: 'Random', tla: 'RDN');

  const FotbalMatch match1 =
      FotbalMatch(homeTeam: t1, awayTeam: t2, winningTeam: 'home_team');
  const FotbalMatch match2 =
      FotbalMatch(homeTeam: t1, awayTeam: t3, winningTeam: 'home_team');
  const FotbalMatch match3 =
      FotbalMatch(homeTeam: t1, awayTeam: t2, winningTeam: 'away_team');
  const FotbalMatch match4 =
      FotbalMatch(homeTeam: t3, awayTeam: t1, winningTeam: 'away_team');

  setUp(() {
    mockService = MockMatchesService();
    sut = HomePageBloc(mockService);
  });

  test('the correct winning team is calculated', () async {
    when(() => mockService.getMatches()).thenAnswer((invocation) async =>
        Future<List<FotbalMatch>>.value([match1, match2, match3, match4]));

    expectLater(
        sut.stream,
        emitsInOrder([
          HomePageStateLoading(),
          HomePageStateDataLoadedSuccess(t1),
        ]));

    sut.add(GetWinningTeam());
    sut.close();
  });

  test('the correct winning team is calculated', () async {
    when(() => mockService.getMatches()).thenAnswer((invocation) async =>
        Future<List<FotbalMatch>>.value([match1, match2, match3, match4]));

    expectLater(
        sut.stream,
        emitsInOrder([
          HomePageStateLoading(),
          HomePageStateDataLoadedSuccess(t1),
        ]));

    sut.add(GetWinningTeam());
    sut.close();
  });

  test('the service throws error', () async {
    when(() => mockService.getMatches())
        .thenThrow(Exception('something went wrong'));

    expectLater(
        sut.stream,
        emitsInOrder([
          HomePageStateLoading(),
          HomePageStateLoadingError('something went wrong'),
        ]));

    sut.add(GetWinningTeam());
    sut.close();
  });

  test('the service returns empty list', () async {
    when(() => mockService.getMatches())
        .thenAnswer((invocation) async => Future<List<FotbalMatch>>.value([]));

    expectLater(
        sut.stream,
        emitsInOrder([
          HomePageStateLoading(),
          HomePageStateLoadingError('there were no matches to be found'),
        ]));

    sut.add(GetWinningTeam());
    sut.close();
  });
}
