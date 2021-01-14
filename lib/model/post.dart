import 'package:EnglishLearnerForum/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  Post(this.userRef, this.title, this.content, this.state, this.tags,
      this.filesURL);
  String userRef;
  String title;
  String content;
  String state;
  List<String> tags;
  List<String> filesURL;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
