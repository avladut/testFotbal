import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_state.dart';
import 'package:fotbal_project/presentation/screens/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeBloc extends Mock implements HomePageBloc {
  @override
  void getWinningTeam() {
    // TODO: implement getWinningTeam
  }
}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  HomePageBloc mockBloc = MockHomeBloc();

  setUp(() async {
    await GetIt.I.reset();
    GetIt.I.registerFactory<HomePageBloc>(() => mockBloc);
  });

  testGoldens(
    'Home page initial',
    (tester) async {
      whenListen(mockBloc, Stream.fromIterable([HomePageStateLoading()]),
          initialState: HomePageStateInitial());
      //should not be needed
      when(() => mockBloc.state).thenReturn(HomePageStateLoading());

      await tester.pumpWidgetBuilder(HomePage());

      await multiScreenGolden(tester, 'home_page_initial');
    },
  );
}
