import 'package:fotbal_project/data/api_impl.dart';
import 'package:fotbal_project/domain/services/get_matches_service.dart';
import 'package:fotbal_project/presentation/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/api.dart';

//final locator = GetIt.I;
void setupLocator() {
  GetIt.I.registerLazySingleton<Api>(() => ApiImpl());
  GetIt.I.registerFactory<HomePageBloc>(
      () => HomePageBloc(GetIt.I.get<GetMatchesService>()));
  GetIt.I.registerFactory<GetMatchesService>(
      () => GetMatchesService(GetIt.I.get<Api>()));
}
