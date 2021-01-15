import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  bool _checkBoxvalueA = false;
  bool _checkBoxvalueB = false;
  bool _checkBoxvalueC = false;
  bool _checkBoxvalueD = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bài tập"),
          centerTitle: true,
          backgroundColor: Colors.cyanAccent[400],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0x8f008f),
                height: 1500,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Text(
                        "Câu 1: Is this the first question ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueA,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueA = value;
                            });
                          },
                        ),
                        Text("This is the first choice")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueB,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueB = value;
                            });
                          },
                        ),
                        Text("This is the second choice")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueC,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueC = value;
                            });
                          },
                        ),
                        Text("This is the third choice")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueD,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueD = value;
                            });
                          },
                        ),
                        Text("This is the final choice")
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Text(
                        "Câu 2: Is this the second question ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueA,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueA = value;
                            });
                          },
                        ),
                        Text("This is the first choice")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueB,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueB = value;
                            });
                          },
                        ),
                        Text("This is the second choice")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueC,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueC = value;
                            });
                          },
                        ),
                        Text("This is the third choice")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checkBoxvalueD,
                          onChanged: (bool value) {
                            setState(() {
                              _checkBoxvalueD = value;
                            });
                          },
                        ),
                        Text("This is the final choice")
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
