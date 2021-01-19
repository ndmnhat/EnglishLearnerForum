import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:EnglishLearnerForum/model/topic.dart';

class TopicRepository {
  CollectionReference topics;
  TopicRepository() {
    topics = FirebaseFirestore.instance.collection('topics');
  }

  Stream<List<Topic>> getAllTopics() {
    return topics.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Topic.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addNewTopic(Topic topic) {
    return topics.add(topic.toDocument());
  }

  Future<void> updateTopic(Topic topic) {
    return topics.doc(topic.id).update(topic.toDocument());
  }

  Future<void> deleteTopic(Topic topic) {
    return topics.doc(topic.id).delete();
  }
}
