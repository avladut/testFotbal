import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fotbal_project/data/models/team_dto.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('creating team from json', () async {
    final String teamJSON =
        await rootBundle.loadString('test/data/test_json/team_json');
    final data = await json.decode(teamJSON);
    final team = TeamDTO.fromJson(data);
    expect(team.id, '9');
    expect(team.name, 'Hertha BSC');
    expect(team.tla, 'BSC');
  });
}
