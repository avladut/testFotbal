class TeamDTO {
  TeamDTO({
    required this.id,
    required this.name,
    required this.tla,
  });

  final String name;
  final String tla;
  final String id;

  factory TeamDTO.fromJson(Map<String, dynamic> json) => TeamDTO(
        id: json['id'].toString(),
        name: json['name'],
        tla: json['tla'],
      );
}
