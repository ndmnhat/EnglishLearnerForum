import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:EnglishLearnerForum/model/post.dart';
import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/pages/post_page.dart';
import 'package:EnglishLearnerForum/ui/widgets/UserAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

class PostItemParent extends StatelessWidget {
  final User user;
  final Post post;
  const PostItemParent({Key key, @required this.post, @required this.user})
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
      child: PostItem(post: post, user: user),
    );
  }
}

class PostItem extends StatelessWidget {
  final User user;
  final Post post;
  PostItem({this.post, this.user});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("__postItem__"),
      child: Padding(
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
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    padding: const EdgeInsets.fromLTRB(3, 0, 0, 3),
                    child: Text(
                      post.title ?? "",
                      overflow: TextOverflow.clip,
                      textDirection: TextDirection.ltr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return PostPageParent(
                    commentRepository: CommentRepository(post),
                    post: post,
                    user: user,
                  );
                },
              ),
            );
          },
        ),
      ),
      background: slideRightBackground(),
      secondaryBackground: slideLeftBackground(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          _showDialog(
            context,
            title: "Xác nhận xoá",
            content: "Bạn có muốn xoá?",
            onCancel: () {},
            onConfirm: () {
              BlocProvider.of<PostBloc>(context).add(DeletePost(post));
              Navigator.of(context).pop(true);
            },
          );
        } else if (direction == DismissDirection.startToEnd) {}
        return false;
      },
    );
  }

  Future<bool> _showDialog(BuildContext context,
      {String title,
      String content,
      Function onCancel,
      Function onConfirm}) async {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text("Huỷ bỏ"),
            onPressed: () {
              onCancel();
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: Text("Xác nhận"),
            onPressed: () {
              onConfirm();
            },
          ),
        ],
      ),
    );
  }
}

Widget slideRightBackground() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Container(
      color: Colors.yellow,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Sửa",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "Xoá",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    ),
  );
}
