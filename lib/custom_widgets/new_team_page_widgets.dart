import 'package:flutter/material.dart';
import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:async';

class FormText extends StatelessWidget {
  final String text;
  const FormText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      height: 70,
      width: 100,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
class FormCheckbox extends StatefulWidget {
  late Bool isChecked;
  final String label;
  FormCheckbox(this.label, this.isChecked);

  @override
  _FormCheckboxState createState() => _FormCheckboxState();
}

class _FormCheckboxState extends State<FormCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: SelectButton(
        color: widget.isChecked.data ? Colors.greenAccent : Colors.redAccent,
        onPressed: () {
          setState(() {
            widget.isChecked.data = !widget.isChecked.data;
          });
        },
        label: widget.label,
      ),
    );
  }
}




class FormField extends StatelessWidget {
  final String label;
  final Str input;
  FormField(this.label, this.input);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(label),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter here',
          ),
        ),
      ],
    );
  }
}

class FormCounter extends StatefulWidget {
  final String label;
  final Int input;
  const FormCounter(this.label, this.input);
  @override
  _FormCounterState createState() => _FormCounterState();
}

class _FormCounterState extends State<FormCounter> {
  void add() {
    setState(() {
      widget.input.data += 1;
    });
  }

  void subtract() {
    setState(() {
      if(widget.input.data>0) {
        widget.input.data -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        widget.label,
        textScaleFactor: 2,
        style: TextStyle(fontSize: 16.5)
      ),

      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        
        CounterButton(add, true),
        SizedBox(
          width: 140,
          height: 100,
          child: Center(
            child: Text(
              widget.input.data.toString(),
              textScaleFactor: 2,
              style: const TextStyle(fontSize: 35),
            ),
          ),
        ),
        CounterButton(subtract, false),
      ]),
    ]);
  }
}

class CounterButton extends StatelessWidget {
  final Function activate;
  final bool isAdd;
  const CounterButton(this.activate, this.isAdd);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        activate();
      },
      elevation: 2.0,
      fillColor: isAdd ? Colors.greenAccent : Colors.redAccent,
      child: Icon(
        isAdd ? Icons.add : Icons.remove,
        size: 40.0,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
    );
  }
}

class FormMultChoice extends StatefulWidget {
  final List<String> choices;
  final Str selection;
  final String label;
  FormMultChoice(this.label, this.choices, this.selection);

  @override
  _FormMultChoiceState createState() => _FormMultChoiceState();
}

class _FormMultChoiceState extends State<FormMultChoice> {
  void changeState(String data) {
    setState(() {
      widget.selection.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Text(
        widget.label,
        textScaleFactor: 2,
        style: const TextStyle(fontSize: 16.5)
      )
    ];
    for (String choice in widget.choices) {
      widgets.add(const SizedBox(
        height: 8,
      ));
      widgets.add(SizedBox(
        width: 300,
        child: SelectButton(
          label: choice,
          color:
          widget.selection.data == choice ? Colors.blue : Colors.blueGrey,
          onPressed: () {
            changeState(choice);
          },
        ),
      ));
    }
    return Column(
      children: widgets,
    );
  }
}

class SelectButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String label;
  const SelectButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: RawMaterialButton(
        onPressed: () {
          onPressed();
        },
        fillColor: color,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 26),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        elevation: 2,
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  final Str comment;
  const CommentBox(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:TextField(
      onChanged: (data) {
        comment.data = data;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Enter Text Here',
      ),
      maxLines: null,
      minLines: 1,
      )
    );
  }
}
class Team_Points extends StatelessWidget {
  final Str comment;
  const Team_Points(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child:Column(
            children:<Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    const Text("Alliance Team 1: ",style: TextStyle(fontSize: 30)),
                    SizedBox(
                        width: 120,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 30),
                          textAlign : TextAlign.center,
                          onChanged: (data) {
                            comment.data = data;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          maxLines: null,
                          minLines: 1,
                        )
                    )
                  ]
              ),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    const Text("Alliance Team 2: ",style: TextStyle(fontSize: 30)),
                    SizedBox(
                        width: 120,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 30),
                          textAlign : TextAlign.center,
                          onChanged: (data) {
                            comment.data = data;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          maxLines: null,
                          minLines: 1,
                        )
                    )
                  ]
              ),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    const Text("Alliance's Score: ",style: TextStyle(fontSize: 30)),
                    SizedBox(
                      width: 120,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 30),
                        textAlign : TextAlign.center,
                        onChanged: (data) {
                          comment.data = data;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        maxLines: null,
                        minLines: 1,
                      )
                    )
          ]
        ),
        ]
        )
    );
  }
}


class TeamInput extends StatefulWidget {
  final Int number;
  const TeamInput(this.number, {Key? key}) : super(key: key);
  @override
  TeamInputState createState() => TeamInputState();
}

class TeamInputState extends State<TeamInput> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0,20.0,0,0),
                child: PinPut(
                  pinAnimationType: PinAnimationType.scale,
                  eachFieldHeight: 100,
                  eachFieldWidth: 70,
                  fieldsCount: 4,
                  textStyle: TextStyle(fontSize: 50),
                  onSubmit: (String pin) => {
                    widget.number.data = int.parse(pin, onError: (e) => 0000),
                    print(widget.number.data)
                  },
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.lightBlueAccent.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        );
      },
    );
  }
}




String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}



class StopwatchPage extends StatefulWidget {
  final String text;
  final Str label;
  StopwatchPage(this.label, this.text);
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }

    setState(() {});
  }
  void handleReset() {
    _stopwatch.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.text+formatTime(_stopwatch.elapsedMilliseconds), style: TextStyle(fontSize: 35.0)),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            SizedBox(
              width: 100.0,
              height: 50.0,
              child:ElevatedButton(
                    onPressed: handleStartStop,
                    child: Text(_stopwatch.isRunning ? 'Stop' : 'Start',style: TextStyle(fontSize: 20),)),),
                const SizedBox(width:10.0),
                SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child:ElevatedButton(
                    onPressed: handleReset,
                    child: Text('Reset',style: TextStyle(fontSize: 20),)),)
              ],
            ),

            const SizedBox(height: 10.0),
          ],
    );
  }
}
