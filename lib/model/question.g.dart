// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    id: json['id'] as String,
    content: json['content'] as String,
    answers: (json['answers'] as List)?.map((e) => e as String)?.toList(),
    rightAnswer: json['rightAnswer'] as String,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'answers': instance.answers,
      'rightAnswer': instance.rightAnswer,
    };
