import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:EnglishLearnerForum/ui/widgets/commentWidgets/commentItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentsLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is CommentsLoaded) {
          final comments = state.comments;
          if (comments.length == 0)
            return Container();
          else {
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentItemParent(comment: comment);
              },
              shrinkWrap: true,
            );
          }
        } else
          return Container();
      },
    );
  }
}
