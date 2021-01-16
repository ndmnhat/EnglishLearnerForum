import 'package:EnglishLearnerForum/ui/pages/account.dart';
import 'package:EnglishLearnerForum/ui/pages/constants.dart';
import 'package:EnglishLearnerForum/ui/pages/exercise.dart';
import 'package:EnglishLearnerForum/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent[400],
        centerTitle: true,
        title: Text(
          "Chủ đề",
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        //child: new Stack(
        //children: <Widget>[
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.lime),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200]),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.cyanAccent[400],
                        ),
                        Text("Username")
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 0, 50),
                      child: Text(
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: RaisedButton(
                            onPressed: onPressComment,
                            child: Text("Bình luận"),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 360,
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.lime),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200]),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.cyanAccent[400],
                        ),
                        Text("Username2")
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 0, 50),
                      child: Text(
                          "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: RaisedButton(
                            onPressed: onPressComment,
                            child: Text("Bình luận"),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        //],
        //),
      ),
    );
  }

  void choiceAction(String choice) {
    print("WORKING");
  }

  void onPressComment() {}
}
