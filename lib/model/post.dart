import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  Post(
      {this.id,
      @required this.topic_id,
      @required this.userRef,
      @required this.title,
      @required this.content,
      @required this.state,
      this.tags,
      this.filesURL});
  String id;
  String topic_id;
  String userRef;
  String title;
  String content;
  String state;
  List<String> tags;
  List<String> filesURL;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
  factory Post.fromSnapshot(DocumentSnapshot snap) {
    return Post(
      id: snap.id,
      topic_id: snap.data()['topic_id'] as String,
      userRef: snap.data()['userRef'] as String,
      title: snap.data()['title'] as String,
      content: snap.data()['content'] as String,
      state: snap.data()['state'] as String,
      tags: (snap.data()['tags'] as List)?.map((e) => e as String)?.toList(),
      filesURL:
          (snap.data()['filesURL'] as List)?.map((e) => e as String)?.toList(),
    );
  }
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'userRef': userRef,
        'topic_id': topic_id,
        'title': title,
        'content': content,
        'state': state,
        'tags': tags,
        'filesURL': filesURL,
      };
}
