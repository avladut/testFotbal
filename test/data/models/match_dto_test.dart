import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fotbal_project/data/models/match_dto.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('creating match from json', () async {
    final String matchJSON =
        await rootBundle.loadString('test/data/test_json/match_json');
    final data = await json.decode(matchJSON);
    final match = MatchDTO.fromJson(data);

    //home team tests
    expect(match.homeTeam.id, '4');
    expect(match.homeTeam.name, 'Borussia Dortmund');
    expect(match.homeTeam.tla, 'BVB');

    //away team tests
    expect(match.awayTeam.id, '9');
    expect(match.awayTeam.name, 'Hertha BSC');
    expect(match.awayTeam.tla, 'BSC');

    //winner test
    expect(match.winningTeam, 'HOME_TEAM');
  });
}
