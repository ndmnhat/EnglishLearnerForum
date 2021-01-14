// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResult _$ExerciseResultFromJson(Map<String, dynamic> json) {
  return ExerciseResult(
    json['exerciseRef'] as String,
    json['score'] as int,
  );
}

Map<String, dynamic> _$ExerciseResultToJson(ExerciseResult instance) =>
    <String, dynamic>{
      'exerciseRef': instance.exerciseRef,
      'score': instance.score,
    };
