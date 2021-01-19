import 'package:EnglishLearnerForum/blocs/topicBloc/topic.dart';
import 'package:EnglishLearnerForum/model/topic.dart';
import 'package:EnglishLearnerForum/ui/widgets/topicWidgets/topicItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class TopicList extends StatelessWidget {
  final User user;
  const TopicList({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicBloc, TopicState>(
      builder: (context, state) {
        if (state is TopicsLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is TopicsLoaded) {
          final topics = state.topics;
          if (topics.length == 0)
            return Text("Không có chủ đề");
          else {
            return ListView.builder(
              primary: false,
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return TopicItem(
                  topic: topic,
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
