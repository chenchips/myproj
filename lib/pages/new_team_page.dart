import 'package:flutter/material.dart';
import 'package:my_wb/custom_widgets/new_team_page_widgets.dart';
import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';
import '../constants.dart';
import '../team.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
class NewTeamPage extends StatelessWidget {
  Team team = Team(
    //basic
    number: Int(-1),

//auto
    crossedLine: Bool(false),
    autoInner: Int(0),
    autoOuter: Int(0),
    autoBottom: Int(0),
    autoFouls: Int(0),
    autoDisconnect: Bool(false),

//teleop
    teleopInner: Int(0),
    teleopOuter: Int(0),
    teleopBottom: Int(0),
    teleopFouls: Int(0),
    teleopDisconnect: Bool(false),

//endgame
    endgameTask: Str("None"),
    endgameFouls: Int(0),
    endgameDisconnect: Bool(false),

//misc
    comments: Str(""),
    points: Int(0),
  );

  NewTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log New Team'),
      ),
      body: Center(
        child: ListView(
          children: [
            const FormText("Team Number"),
            TeamInput(team.number),
            Container(child: const Text("*For 1-3 Digit Numbers, fill with 0 before the Team#"),alignment: Alignment.topCenter,),
            const SizedBox(height: 10),
            const FormText("Auto: 15 sec"),
            const SizedBox(height: 10),
            FormCheckbox("Robot Crossed Line?", team.crossedLine),
            FormCounter("Inner Port:", team.autoInner),
            FormCounter("Outer Port:", team.autoOuter),
            FormCounter("Bottom Port:", team.autoBottom),
            FormCounter("Fouls:", team.autoFouls),
            const SizedBox(height: 10),
            FormCheckbox("Robot Disconnected?", team.autoDisconnect),
            const SizedBox(height: 10),
            const FormText("Teleop: 100 sec"),
            const SizedBox(height: 10),
            FormCounter("Inner Port:", team.teleopInner),
            FormCounter("Outer Port:", team.teleopOuter),
            FormCounter("Bottom Port:", team.teleopBottom),
            FormCounter("Fouls:", team.teleopFouls),
            const SizedBox(height: 10),
            FormCheckbox("Robot Disconnected?", team.teleopDisconnect),
            const SizedBox(height: 10),
            const FormText("Endgame: 30 sec"),
            const SizedBox(height: 10),
            FormMultChoice(
              "End Game Task:",
              const ['Hang', 'Park', 'Level', 'None'],
              team.endgameTask,
            ),
            const SizedBox(height: 10),
            FormCounter("Fouls:", team.endgameFouls),
            const SizedBox(height: 10),
            FormCheckbox("Robot Disconnected?", team.endgameDisconnect),
            const SizedBox(height: 10),
            const FormText("Comments"),
            const SizedBox(height: 10),
            CommentBox(team.comments),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 75,
        color: Colors.blue,
        child: FlatButton(
          onPressed: () async {
            if(team.number.data > 0) {
              print(team.toJson());
              await http.post(
                Uri.parse(server + '/add'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: team.toJson(),
              );
              Navigator.pop(context);
            }
            else{
              print("invalid");
            }
          },
          child: const Text(
            "Submit",
            textScaleFactor: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(team.toJson());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}