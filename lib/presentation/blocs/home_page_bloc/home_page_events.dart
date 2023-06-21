import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {}

class GetWinningTeam extends HomePageEvent {
  @override
  List<Object?> get props => [];
}
