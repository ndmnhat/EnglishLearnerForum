import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:EnglishLearnerForum/model/topic.dart';
import 'package:EnglishLearnerForum/model/post.dart';

class PostRepository {
  CollectionReference posts;
  PostRepository(Topic topic) {
    posts = FirebaseFirestore.instance
        .collection('topics')
        .doc(topic.id)
        .collection('posts');
  }

  Stream<List<Post>> getAllPosts() {
    return posts.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Post.fromSnapshot(doc));
    });
  }

  Future<void> addNewPost(Post post) {
    return posts.add(post.toDocument());
  }

  Future<void> updatePost(Post post) {
    return posts.doc(post.id).update(post.toDocument());
  }

  Future<void> deletePost(Post post) {
    return posts.doc(post.id).delete();
  }
}
