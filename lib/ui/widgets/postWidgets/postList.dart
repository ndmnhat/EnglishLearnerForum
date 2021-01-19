import 'package:EnglishLearnerForum/blocs/bloc.dart';
import 'package:EnglishLearnerForum/ui/widgets/postWidgets/postItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatelessWidget {
  final User user;
  const PostList({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostsLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is PostsLoaded) {
          final posts = state.posts;
          if (posts.length == 0)
            return Text("Không có bài viết");
          else {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostItemParent(
                  post: post,
                  user: user,
                );
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
