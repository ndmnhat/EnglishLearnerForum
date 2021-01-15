import 'package:Giaodien/account.dart';
import 'package:Giaodien/constants.dart';
import 'package:Giaodien/exercise.dart';
import 'package:flutter/material.dart';
import 'package:Giaodien/home.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'dart:html';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 0;

  final List<Widget> _children = [
    HomePage(),
    ExercisePage(),
    AccountPage()
  ];

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
                title: Text("Diễn đàn"),
                icon: Icon(MdiIcons.forum),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                title: Text("Bài tập"),
                icon: Icon(MdiIcons.calendarCheck),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                title: Text("Tài khoản"),
                icon: Icon(MdiIcons.account),
                backgroundColor: Colors.green)
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        )
        );
  }

  

 
}
