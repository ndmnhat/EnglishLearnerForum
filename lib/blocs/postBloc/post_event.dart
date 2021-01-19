import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/post.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostEvent {}

class AddPost extends PostEvent {
  final Post post;

  const AddPost(this.post);

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'AddTodo { todo: $post }';
}

class UpdatePost extends PostEvent {
  final Post updatedPost;

  const UpdatePost(this.updatedPost);

  @override
  List<Object> get props => [updatedPost];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedPost }';
}

class DeletePost extends PostEvent {
  final Post post;

  const DeletePost(this.post);

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'DeleteTodo { todo: $post }';
}

class PostsUpdated extends PostEvent {
  final List<Post> posts;

  const PostsUpdated(this.posts);

  @override
  List<Object> get props => [posts];
}
