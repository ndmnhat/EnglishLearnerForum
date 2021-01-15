import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:EnglishLearnerForum/model/post.dart';
import 'package:EnglishLearnerForum/model/comment.dart';

class CommentRepository {
  CollectionReference comments;
  CommentRepository(Post post) {
    comments = FirebaseFirestore.instance
        .collection('topics')
        .doc(post.topic_id)
        .collection('posts')
        .doc(post.id)
        .collection('comments');
  }

  Stream<List<Comment>> getAllComments() {
    return comments.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Comment.fromSnapshot(doc));
    });
  }

  Future<void> addNewComment(Comment comment) {
    return comments.add(comment.toDocument());
  }

  Future<void> updateComment(Comment comment) {
    return comments.doc(comment.id).update(comment.toDocument());
  }

  Future<void> deleteComment(Comment comment) {
    return comments.doc(comment.id).delete();
  }
}
