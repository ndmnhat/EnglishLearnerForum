// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['content'] as String,
    (json['answers'] as List)?.map((e) => e as String)?.toList(),
    json['rightAnswer'] as String,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'content': instance.content,
      'answers': instance.answers,
      'rightAnswer': instance.rightAnswer,
    };
