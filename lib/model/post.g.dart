// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as String,
    topic_id: json['topic_id'] as String,
    userRef: json['userRef'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    state: json['state'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    filesURL: (json['filesURL'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'topic_id': instance.topic_id,
      'userRef': instance.userRef,
      'title': instance.title,
      'content': instance.content,
      'state': instance.state,
      'tags': instance.tags,
      'filesURL': instance.filesURL,
    };
