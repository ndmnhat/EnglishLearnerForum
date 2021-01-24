import 'package:EnglishLearnerForum/ui/pages/account.dart';
import 'package:EnglishLearnerForum/ui/pages/constants.dart';
import 'package:EnglishLearnerForum/ui/pages/exercise.dart';
import 'package:flutter/material.dart';
import 'package:EnglishLearnerForum/ui/pages/home.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:EnglishLearnerForum/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:html';

class PageParent extends StatefulWidget {
  final User user;
  final UserRepository userRepository;
  PageParent({this.user, this.userRepository});
  @override
  _PageParentState createState() =>
      _PageParentState(user: this.user, userRepository: this.userRepository);
}

class _PageParentState extends State<PageParent> {
  List<Widget> _children;
  int _currentindex = 0;
  User user;
  UserRepository userRepository;
  _PageParentState({this.user, this.userRepository}) {
    _children = [
      HomePageParent(user: user, userRepository: userRepository),
      ExercisePage(),
      AccountPageParent(user: user, userRepository: userRepository)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.cyanAccent,
          currentIndex: _currentindex,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 20,
          items: [
            BottomNavigationBarItem(
                label: "Diễn đàn",
                icon: Icon(MdiIcons.forum),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                // title: Text("Bài tập"),
                label: "Bài tập",
                icon: Icon(MdiIcons.calendarCheck),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                // title: Text("Tài khoản"),
                label: "Tài khoản",
                icon: Icon(MdiIcons.account),
                backgroundColor: Colors.green)
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ));
  }
}
