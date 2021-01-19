import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:EnglishLearnerForum/blocs/commentBloc/comment.dart';
import 'package:EnglishLearnerForum/model/post.dart';
import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/pages/constants.dart';
import 'package:EnglishLearnerForum/ui/widgets/commentWidgets/commentList.dart';
import 'package:EnglishLearnerForum/ui/widgets/commentWidgets/fullPostItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostPageParent extends StatelessWidget {
  final Post post;
  final User user;
  final CommentRepository commentRepository;
  const PostPageParent({Key key, this.commentRepository, this.user, this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommentBloc>(
          create: (context) => CommentBloc(commentRepository: commentRepository)
            ..add(LoadComments()),
        ),
      ],
      child: PostPage(
        post: post,
        user: user,
        commentRepository: commentRepository,
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  final Post post;
  final User user;
  final CommentRepository commentRepository;
  PostPage({this.user, this.commentRepository, this.post});
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent[400],
        centerTitle: true,
        title: Text(
          "Bình luận",
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FullPostItemParent(post: widget.post, user: widget.user),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Bình luận",
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          CommentList(),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == "Đăng xuất")
      BlocProvider.of<AuthBloc>(context).add(UserLogOutEvent());
  }

  void onPressComment() {}
}
