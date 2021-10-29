import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class StatisticsAPIAccessor {
  String _uriBase = 'https://www.thebluealliance.com/api/v3';
  Map<String, String> _header = {
    'X-TBA-Auth-Key':
        "JAuW8W8YRGoCk0zREOgnqkGPtfUX5UAfHvd6Ze1ixcPUB3F2tpwXV24l7qoUUnqL",
  };

  Future<List<Team>> getTeamsFromEvent(String eventCode) async {
    Response response;
    List<Team> teams = [];
    response = await http.get(Uri.parse("$_uriBase/event/$eventCode/teams"),
        headers: _header);

    for (var team in jsonDecode(response.body)) {
      teams.add(new Team(team));
    }

    return teams;
  }

  Future<Map<String, TeamPerformance>> getTeamPerformanceFromEvent(
      eventCode) async {
    Response response;
    Map<String, TeamPerformance> teams = Map<String, TeamPerformance>();
    response = await http.get(Uri.parse("$_uriBase/event/$eventCode/oprs"),
        headers: _header);

    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    Map<String, dynamic> oprs = decodedResponse['oprs'];
    Map<String, dynamic> dprs = decodedResponse['dprs'];
    Map<String, dynamic> ccwms = decodedResponse['ccwms'];

    for (int i = 0; i < decodedResponse['oprs'].length; i++) {
      String key = oprs.keys.elementAt(i);
      teams[key] = new TeamPerformance(
          key, oprs[key] ?? -1, dprs[key] ?? -1, ccwms[key] ?? -1);
    }
    return teams;
  }
}

class Team {
  late String key, nickname, name, schoolName, city, stateProvince, country;
  late int teamNumber;

  Team(Map<String, dynamic> team) {
    this.key = team['key'] ?? '';
    this.nickname = team['nickname'] ?? '';
    this.name = team['name'] ?? '';
    this.schoolName = team['school_name'] ?? '';
    this.city = team['city'] ?? '';
    this.stateProvince = team['state_province'] ?? '';
    this.country = team['country'] ?? '';
    this.teamNumber = team['team_number'] ?? '';
  }
}

class TeamPerformance {
  late String key;
  late double opr, ccwm, dpr;

  TeamPerformance(String key, double opr, double ccwm, double dpr) {
    this.key = key;
    this.opr = opr;
    this.ccwm = ccwm;
    this.dpr = dpr;
  }
}
