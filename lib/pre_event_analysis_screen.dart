import 'package:flutter/material.dart';
import 'package:mustang_mini_app/statistics_api_accessor.dart';

class PreEventAnalysisPage extends StatefulWidget {
  String titleText = "";

  PreEventAnalysisPage(String titleText) {
    this.titleText = titleText;
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

    Map<String, TeamPerformance> teamPerformances =
        await api.getTeamPerformanceFromEvent(eventCode);

    setState(() {
      this.teams = newListOfTeams;
      this.performances = teamPerformances;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.titleText), backgroundColor: Colors.green[900]),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (BuildContext context, int index) => AnalysisListItem(
            teams[index].teamNumber.toString(),
            teams[index].schoolName,
            performances[teams[index].key]!.opr),
      ),
    );
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
                  name!,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  teamKey!,
                  style: TextStyle(fontSize: 18),
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
