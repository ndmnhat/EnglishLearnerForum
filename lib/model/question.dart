import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  Question(
      {this.id,
      @required this.content,
      @required this.answers,
      @required this.rightAnswer});
  String id;
  String content;
  List<String> answers;
  String rightAnswer;
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
  factory Question.fromSnapshot(DocumentSnapshot snap) =>
      Question.fromJson(snap.data());
  Map<String, dynamic> toDocument() => <String, dynamic>{
        'content': content,
        'answers': answers,
        'rightAnswer': rightAnswer,
      };
}
