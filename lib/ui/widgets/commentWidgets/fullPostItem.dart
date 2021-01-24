import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:EnglishLearnerForum/model/comment.dart';
import 'package:EnglishLearnerForum/model/post.dart';
import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/widgets/UserAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

class FullPostItemParent extends StatelessWidget {
  final User user;
  final Post post;
  const FullPostItemParent({Key key, @required this.post, @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfileBloc>(
          create: (context) =>
              UserProfileBloc(userProfileRepository: UserRepository())
                ..add(LoadUserProfile(post.userRef)),
        ),
      ],
      child: FullPostItem(post: post, user: user),
    );
  }
}

class FullPostItem extends StatelessWidget {
  final User user;
  final Post post;
  FullPostItem({this.post, this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(10.0),
          //margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[100], width: 0.5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  UserAvatar(),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: BlocBuilder<UserProfileBloc, UserProfileState>(
                      builder: (context, state) {
                        if (state is UserProfileLoaded)
                          return Text(state.userProfile.displayName ?? "");
                        else
                          return Text("Username");
                      },
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Flexible(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10, 3, 3, 3),
                        padding: const EdgeInsets.fromLTRB(3, 0, 0, 3),
                        child: Text(
                          post.title ?? "",
                          overflow: TextOverflow.clip,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10, 3, 3, 3),
                        padding: const EdgeInsets.fromLTRB(3, 0, 0, 3),
                        child: Text(
                          post.content ?? "",
                          overflow: TextOverflow.clip,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        textDirection: TextDirection.ltr,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OutlineButton(
                            child: Text("Thích"),
                            onPressed: () {},
                          ),
                          OutlineButton(
                            child: Text("Bình luận"),
                            onPressed: () {
                              _showAddForm(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Future<bool> _showAddForm(BuildContext context) async {
    TextEditingController _contentcontroller = new TextEditingController();

    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            scrollable: true,
            title: Text('Bình luận'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nội dung',
                      ),
                      controller: _contentcontroller,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              RaisedButton(
                child: Text("Huỷ bỏ"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                  child: Text("Thêm"),
                  onPressed: () {
                    Comment comment = new Comment(
                      userRef: user.uid,
                      content: _contentcontroller.text,
                    );
                    BlocProvider.of<CommentBloc>(context)
                        .add(AddComment(comment));
                    Navigator.of(context).pop(true);
                  })
            ],
          );
        });
  }
}
