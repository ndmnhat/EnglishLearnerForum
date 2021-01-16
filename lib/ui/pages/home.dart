import 'dart:ui';
import 'package:EnglishLearnerForum/ui/pages/constants.dart';
import 'package:EnglishLearnerForum/ui/pages/theme.dart';
//import 'package:EnglishLearnerForum/model/User.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:meta/meta.dart';

class HomePageParent extends StatelessWidget {
  final User user;
  final UserRepository userRepository;

  HomePageParent({@required this.user, @required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(userRepository: userRepository),
      child: HomePage(user: user, userRepository: userRepository),
    );
  }
}

class HomePage extends StatefulWidget {
  final User user;
  final UserRepository userRepository;
  HomePage({this.user, this.userRepository});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc homePageBloc;
  @override
  Widget build(BuildContext context) {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent[400],
        centerTitle: true,
        title: Text(
          "Diễn Đàn",
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: onChuDe1Click,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.cyanAccent[400],
                  child: Text("CHỦ ĐỀ 1"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: onChuDe1Click,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.cyanAccent[400],
                  child: Text("CHỦ ĐỀ 2"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: onChuDe1Click,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.cyanAccent[400],
                  child: Text("CHỦ ĐỀ 3"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: onChuDe1Click,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.cyanAccent[400],
                  child: Text("CHỦ ĐỀ 4"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: onChuDe1Click,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.cyanAccent[400],
                  child: Text("CHỦ ĐỀ 5"),
                ),
              ),
            ),
          ],
        ),
      ),
      //
    );
  }

  void onChuDe1Click() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ThemePage()));
  }

  void choiceAction(String choice) {
    print("WORKING");
  }
}
