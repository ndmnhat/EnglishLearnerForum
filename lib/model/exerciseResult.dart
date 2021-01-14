import 'package:json_annotation/json_annotation.dart';
part 'exerciseResult.g.dart';

@JsonSerializable()
class ExerciseResult {
  ExerciseResult(this.exerciseRef, this.score);
  String exerciseRef;
  int score;

  factory ExerciseResult.fromJson(Map<String, dynamic> json) =>
      _$ExerciseResultFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseResultToJson(this);
}
