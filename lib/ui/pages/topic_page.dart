import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:EnglishLearnerForum/blocs/postBloc/post.dart';
import 'package:EnglishLearnerForum/model/topic.dart';
import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/pages/constants.dart';
import 'package:EnglishLearnerForum/ui/widgets/postWidgets/addPostButton.dart';
import 'package:EnglishLearnerForum/ui/widgets/postWidgets/postList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TopicPageParent extends StatelessWidget {
  final Topic topic;
  final User user;
  final PostRepository postRepository;
  const TopicPageParent({Key key, this.postRepository, this.user, this.topic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) =>
              PostBloc(postRepository: postRepository)..add(LoadPosts()),
        ),
      ],
      child: TopicPage(
        topic: topic,
        user: user,
        postRepository: postRepository,
      ),
    );
  }
}

class TopicPage extends StatefulWidget {
  final Topic topic;
  final User user;
  final PostRepository postRepository;
  TopicPage({this.user, this.postRepository, this.topic});
  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent[400],
          centerTitle: true,
          title: Text(
            "Bài viết",
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
        body: Column(
          children: [
            PostList(
              user: widget.user,
            ),
            AddPostButton(
              topic: widget.topic,
              user: widget.user,
            )
          ],
        ));
  }

  void choiceAction(String choice) {
    if (choice == "Đăng xuất")
      BlocProvider.of<AuthBloc>(context).add(UserLogOutEvent());
  }

  void onPressComment() {}
}
