import 'package:flutter/material.dart';
import 'package:mustang_mini_app/statistics_api_accessor.dart';

class PreEventAnalysisPage extends StatefulWidget {
  String titleText = "";
  String sortBy = "opr";

  PreEventAnalysisPage(String titleText, String sortBy) {
    this.titleText = titleText;
    this.sortBy = sortBy;
  }

  @override
  State<PreEventAnalysisPage> createState() => _PreEventAnalysisPageState();
}

class _PreEventAnalysisPageState extends State<PreEventAnalysisPage> {
  StatisticsAPIAccessor api = StatisticsAPIAccessor();

  List<AnalysisListItem> listItems = [];
  List<Team> teams = [];
  late Map<String, TeamPerformance> performances =
      new Map<String, TeamPerformance>();

  @override
  void initState() {
    super.initState();
    setState(() {
      refreshListItems(widget.titleText);
    });
  }

  void refreshListItems(String eventCode) async {
    listItems.clear();
    List<Team> newListOfTeams = [];
    newListOfTeams = await api.getTeamsFromEvent(eventCode);
    this.teams = newListOfTeams;
    List<String> sortedTeamCodes = [];
    List<Team> sortedTeams = [];

    Map<String, TeamPerformance> teamPerformances =
        await api.getTeamPerformanceFromEvent(eventCode);

    sortedTeamCodes =
        StatisticsAPIAccessor.sortBy(widget.sortBy, teamPerformances);
    for (int i = 0; i < sortedTeamCodes.length; i++) {
      sortedTeams.add(getTeamFromCode(sortedTeamCodes[i])!);
    }

    setState(() {
      this.teams = sortedTeams;
      this.performances = teamPerformances;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.titleText),
            Text("Sort: " + widget.sortBy.toUpperCase(),
                style: TextStyle(fontSize: 18)),
          ],
        ),
        backgroundColor: Colors.green[900],
      ),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (BuildContext context, int index) {
          if (widget.sortBy == "dpr") {
            return AnalysisListItem(teams[index].teamNumber.toString(),
                teams[index].schoolName, performances[teams[index].key]!.dpr);
          } else if (widget.sortBy == "ccwm") {
            return AnalysisListItem(teams[index].teamNumber.toString(),
                teams[index].schoolName, performances[teams[index].key]!.ccwm);
          } else {
            return AnalysisListItem(teams[index].teamNumber.toString(),
                teams[index].schoolName, performances[teams[index].key]!.opr);
          }
        },
      ),
    );
  }

/**
 * Gets the Team object with the given code
 * If this method returns null, the team code was not found.
 */
  Team? getTeamFromCode(String teamCode) {
    for (int i = 0; i < teams.length; i++) {
      if (teams[i].key == teamCode) {
        return teams[i];
      }
    }
    return null;
  }
}

class AnalysisListItem extends StatelessWidget {
  String? teamKey;
  String? name;
  double? opr;

  AnalysisListItem(String key, String name, double opr) {
    this.teamKey = key;
    this.name = name;
    this.opr = opr;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (name!.length < 30)
                      ? name!
                      : (name!.substring(0, 30) + "..."),
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  teamKey!,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Text(((opr! * 100).round() / 100.0).toString(),
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
