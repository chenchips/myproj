import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_wb/custom_widgets/home_page_widgets.dart';
import 'package:my_wb/constants.dart';

import '../team.dart';
import 'new_team_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Team> teams = [];
  bool hasTeams = false;
  void updateData() async {
    final response = await http.get(Uri.parse(server + "/all"));
    if (response.statusCode == 200) {
      final responseDecoded = jsonDecode(response.body)['teams'];
      setState(() {
        print(responseDecoded);
        teams = [];
        List<Team> comparedTo = [];
        for (dynamic teamData in responseDecoded) {
          teams.add(Team.fromJson(teamData));
        }
        hasTeams = teams.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title),
      ),
      body: Center(
         child: hasTeams ? TeamsDisplay(teams: teams) : Text("No Teams to Show\n\n\n",style:TextStyle(fontSize:30, color: Colors.grey)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          updateData();
        },
        child: const Icon(Icons.refresh, color: Colors.white,),
      ),
      bottomSheet: Container(
        height: 75,
        width: double.infinity,
        color: Colors.blue,
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => NewTeamPage()),
            );
          },
          child: const Text(
            "Log New Team",
            textScaleFactor: 2,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}