
import 'package:flutter/material.dart';
import 'package:my_wb/pages/team_info_page.dart';

import '../team.dart';

class TeamButton extends StatelessWidget {
  final Team team;
  const TeamButton({required this.team});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('Going to: ' + team.number.data.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => TeamPage(team: team)),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 400,
        height: 110,
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Team "+team.number.data.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              "OPR: " + team.points.data.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamsDisplay extends StatelessWidget {
  final List<Team> teams;
  const TeamsDisplay({required this.teams, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> teamButtons = [];
    teamButtons.add(const SizedBox(height:20));
    for (Team team in teams) {
      teamButtons.add(
        TeamButton(team: team),
      );
    }
    teamButtons.add(const SizedBox(height:80));
    return ListView(
      children:
        teamButtons,
    );
  }
}