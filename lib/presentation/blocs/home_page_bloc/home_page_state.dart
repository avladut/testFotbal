import 'package:fotbal_project/domain/models/team.dart';

abstract class HomePageState {}

class HomePageStateInitial extends HomePageState {}

class HomePageStateLoading extends HomePageState {}

class HomePageStateDataLoadedSuccess extends HomePageState {
  HomePageStateDataLoadedSuccess(this.winningTeam);
  final Team? winningTeam;
}

class HomePageStateLoadingError extends HomePageState {
  HomePageStateLoadingError(this.errorMessage);
  final String errorMessage;
}
