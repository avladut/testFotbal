import 'package:equatable/equatable.dart';

class Team extends Equatable {
  const Team({
    required this.id,
    required this.name,
    required this.tla,
  });

  final String name;
  final String tla;
  final String id;

  @override
  List<Object?> get props => [id];
}
