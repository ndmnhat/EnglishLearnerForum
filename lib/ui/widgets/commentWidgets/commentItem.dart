import 'package:EnglishLearnerForum/blocs/userProfileBloc/userProfile.dart';
import 'package:EnglishLearnerForum/model/comment.dart';
import 'package:EnglishLearnerForum/repositories/repository.dart';
import 'package:EnglishLearnerForum/ui/widgets/UserAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

class CommentItemParent extends StatelessWidget {
  final Comment comment;
  const CommentItemParent({Key key, @required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfileBloc>(
          create: (context) =>
              UserProfileBloc(userProfileRepository: UserRepository())
                ..add(LoadUserProfile(comment.userRef)),
        ),
      ],
      child: CommentItem(comment: comment),
    );
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;
  CommentItem({this.comment});
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
                    comment.content ?? "",
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
