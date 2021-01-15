// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResult _$ExerciseResultFromJson(Map<String, dynamic> json) {
  return ExerciseResult(
    id: json['id'] as String,
    exerciseRef: json['exerciseRef'] as String,
    score: json['score'] as int,
  );
}

Map<String, dynamic> _$ExerciseResultToJson(ExerciseResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exerciseRef': instance.exerciseRef,
      'score': instance.score,
    };
