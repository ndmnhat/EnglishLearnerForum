// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['userRef'] as String,
    json['title'] as String,
    json['content'] as String,
    json['state'] as String,
    (json['tags'] as List)?.map((e) => e as String)?.toList(),
    (json['filesURL'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userRef': instance.userRef,
      'title': instance.title,
      'content': instance.content,
      'state': instance.state,
      'tags': instance.tags,
      'filesURL': instance.filesURL,
    };
