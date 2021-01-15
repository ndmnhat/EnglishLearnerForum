// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return Exercise(
    id: json['id'] as String,
    userRef: json['userRef'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'userRef': instance.userRef,
      'title': instance.title,
      'description': instance.description,
    };
