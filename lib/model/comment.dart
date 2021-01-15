import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Comment({this.id, @required this.userRef, @required this.content});
  String id;
  String userRef;
  String content;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
  factory Comment.fromSnapshot(DocumentSnapshot snap) =>
      Comment.fromJson(snap.data());
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'userRef': userRef,
        'content': content,
      };
}
