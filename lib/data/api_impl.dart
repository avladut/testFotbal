import 'dart:convert';

import 'package:fotbal_project/data/api.dart';
import 'package:http/http.dart' as http;

import 'models/match_dto.dart';

class ApiImpl extends Api {
  @override
  Future<List<MatchDTO>> getRecentMatches() async {
    List<MatchDTO> matches = [];
    await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/competitions/PL/matches?matchday=10'),
      headers: {'X-Auth-Token': 'bdd5b3e6c6a3492d8351f0b0bf98c4ec'},
    ).then((response) {
      //todo: refactor this, can't find documentation to add the date
      final responseJson = json.decode(response.body);
      matches = responseJson['matches'] == null
          ? []
          : List<MatchDTO>.from((responseJson['matches'] as List)
              .map((e) => MatchDTO.fromJson(e)));
    }).onError((error, stackTrace) {
      throw Exception('http error');
    });
    return matches;
  }
}
