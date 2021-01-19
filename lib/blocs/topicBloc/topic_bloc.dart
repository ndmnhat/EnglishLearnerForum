import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:EnglishLearnerForum/repositories/topic_repository.dart';
import 'package:EnglishLearnerForum/blocs/topicBloc/topic.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final TopicRepository _topicRepository;
  TopicBloc({@required topicRepository})
      : assert(topicRepository != null),
        _topicRepository = topicRepository,
        super(TopicsLoading());

  @override
  Stream<TopicState> mapEventToState(TopicEvent event) async* {
    if (event is LoadTopics) {
      yield* _mapLoadTopicsToState();
    } else if (event is AddTopic) {
      yield* _mapAddTopicToState(event);
    } else if (event is UpdateTopic) {
      yield* _mapUpdateTopicToState(event);
    } else if (event is DeleteTopic) {
      yield* _mapDeleteTopicToState(event);
    } else if (event is TopicsUpdated) {
      yield* _mapTopicsUpdatedToState(event);
    }
  }

  Stream<TopicState> _mapLoadTopicsToState() async* {
    _topicRepository.getAllTopics().listen(
          (topics) => add(TopicsUpdated(topics)),
        );
  }

  Stream<TopicState> _mapAddTopicToState(AddTopic event) async* {
    _topicRepository.addNewTopic(event.topic);
  }

  Stream<TopicState> _mapUpdateTopicToState(UpdateTopic event) async* {
    _topicRepository.updateTopic(event.updatedTopic);
  }

  Stream<TopicState> _mapDeleteTopicToState(DeleteTopic event) async* {
    _topicRepository.deleteTopic(event.topic);
  }

  Stream<TopicState> _mapTopicsUpdatedToState(TopicsUpdated event) async* {
    yield TopicsLoaded(event.topics);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
