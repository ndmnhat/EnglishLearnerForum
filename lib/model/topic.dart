import 'package:json_annotation/json_annotation.dart';
part 'topic.g.dart';

@JsonSerializable()
class Topic {
  Topic(this.title, this.description);
  String title;
  String description;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
