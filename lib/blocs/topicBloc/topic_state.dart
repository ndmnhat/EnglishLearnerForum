import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/topic.dart';

abstract class TopicState extends Equatable {
  const TopicState();

  @override
  List<Object> get props => [];
}

class TopicsLoading extends TopicState {}

class TopicsLoaded extends TopicState {
  final List<Topic> topics;

  const TopicsLoaded([this.topics = const []]);

  @override
  List<Object> get props => [topics];

  @override
  String toString() => 'TodosLoaded { todos: $topics }';
}

class TopicsNotLoaded extends TopicState {}
