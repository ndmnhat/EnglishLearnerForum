import 'dart:ui';
import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/pages/constants.dart';
import 'package:EnglishLearnerForum/ui/pages/topic_page.dart';
import 'package:EnglishLearnerForum/ui/widgets/topicWidgets/addTopicButton.dart';
import 'package:EnglishLearnerForum/ui/widgets/topicWidgets/topicItem.dart';
import 'package:EnglishLearnerForum/ui/widgets/topicWidgets/topicList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_widget/search_widget.dart';

class HomePageParent extends StatelessWidget {
  final User user;
  final UserRepository userRepository;
  final TopicRepository topicRepository = new TopicRepository();
  HomePageParent({@required this.user, @required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
          create: (context) => HomePageBloc(userRepository: userRepository),
        ),
        BlocProvider<TopicBloc>(
          create: (context) =>
              TopicBloc(topicRepository: topicRepository)..add(LoadTopics()),
        ),
      ],
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
  List<TopicItem> loadTopics = new List<TopicItem>();
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          SearchWidget<TopicItem>(
            dataList: loadTopics,
            queryBuilder: (String query, List<TopicItem> list) {
              return list.toList();
            },
            selectedItemBuilder: (TopicItem topicItem, Function function) {
              return TopicItem();
            },
            popupListItemBuilder: (TopicItem item) {
              return TopicItem();
            },
          ),
          TopicList(user: widget.user),
          AddTopicButton(),
        ],
      ),
      //
    );
  }

  void onChuDe1Click() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TopicPageParent()));
  }

  void choiceAction(String choice) {
    if (choice == "Đăng xuất")
      BlocProvider.of<AuthBloc>(context).add(UserLogOutEvent());
  }
}
