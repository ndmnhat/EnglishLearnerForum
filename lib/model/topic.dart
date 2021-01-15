import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
part 'topic.g.dart';

@JsonSerializable()
class Topic {
  Topic({String id, @required this.title, @required this.description});
  String id;
  String title;
  String description;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
  factory Topic.fromSnapshot(DocumentSnapshot snap) =>
      Topic.fromJson(snap.data());
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'title': title,
        'description': description,
      };
}
