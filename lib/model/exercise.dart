import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  Exercise(
      {this.id,
      @required this.userRef,
      @required this.title,
      @required this.description});
  String id;
  String userRef;
  String title;
  String description;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
  factory Exercise.fromSnapshot(DocumentSnapshot snap) =>
      Exercise.fromJson(snap.data());
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'userRef': userRef,
        'title': title,
        'description': description,
      };
}
