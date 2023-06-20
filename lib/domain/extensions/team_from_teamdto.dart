import 'package:fotbal_project/data/models/team_dto.dart';
import 'package:fotbal_project/domain/models/team.dart';

extension TeamFromTeamDTO on TeamDTO {
  Team toTeam() {
    return Team(
      id: id,
      name: name,
      tla: tla,
    );
  }
}
