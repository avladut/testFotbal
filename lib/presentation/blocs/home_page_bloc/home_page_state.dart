import 'package:equatable/equatable.dart';
import 'package:fotbal_project/domain/models/team.dart';

abstract class HomePageState extends Equatable {}

class HomePageStateInitial extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageStateLoading extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageStateDataLoadedSuccess extends HomePageState {
  HomePageStateDataLoadedSuccess(this.winningTeam);
  final Team? winningTeam;

  @override
  List<Object?> get props => [winningTeam];
}

class HomePageStateLoadingError extends HomePageState {
  HomePageStateLoadingError(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
