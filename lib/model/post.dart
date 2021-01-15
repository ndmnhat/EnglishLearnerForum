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
      @required this.tags,
      @required this.filesURL});
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
  factory Post.fromSnapshot(DocumentSnapshot snap) =>
      Post.fromJson(snap.data());
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
