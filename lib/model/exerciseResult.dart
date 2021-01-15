import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'exerciseResult.g.dart';

@JsonSerializable()
class ExerciseResult {
  ExerciseResult({this.id, @required this.exerciseRef, @required this.score});
  String id;
  String exerciseRef;
  int score;

  factory ExerciseResult.fromJson(Map<String, dynamic> json) =>
      _$ExerciseResultFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseResultToJson(this);
  factory ExerciseResult.fromSnapshot(DocumentSnapshot snap) =>
      ExerciseResult.fromJson(snap.data());
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'exerciseRef': exerciseRef,
        'score': score,
      };
}
