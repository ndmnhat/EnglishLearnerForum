import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostsLoading extends PostState {}

class PostsLoaded extends PostState {
  final List<Post> posts;

  const PostsLoaded([this.posts = const []]);

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'TodosLoaded { todos: $posts }';
}

class PostsNotLoaded extends PostState {}
