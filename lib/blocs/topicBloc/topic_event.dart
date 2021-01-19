import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/topic.dart';

abstract class TopicEvent extends Equatable {
  const TopicEvent();

  @override
  List<Object> get props => [];
}

class LoadTopics extends TopicEvent {}

class AddTopic extends TopicEvent {
  final Topic topic;

  const AddTopic(this.topic);

  @override
  List<Object> get props => [topic];

  @override
  String toString() => 'AddTodo { todo: $topic }';
}

class UpdateTopic extends TopicEvent {
  final Topic updatedTopic;

  const UpdateTopic(this.updatedTopic);

  @override
  List<Object> get props => [updatedTopic];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedTopic }';
}

class DeleteTopic extends TopicEvent {
  final Topic topic;

  const DeleteTopic(this.topic);

  @override
  List<Object> get props => [topic];

  @override
  String toString() => 'DeleteTodo { todo: $topic }';
}

class TopicsUpdated extends TopicEvent {
  final List<Topic> topics;

  const TopicsUpdated(this.topics);

  @override
  List<Object> get props => [topics];
}
