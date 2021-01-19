import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/comment.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentsLoading extends CommentState {}

class CommentsLoaded extends CommentState {
  final List<Comment> comments;

  const CommentsLoaded([this.comments = const []]);

  @override
  List<Object> get props => [comments];

  @override
  String toString() => 'TodosLoaded { todos: $comments }';
}

class CommentsNotLoaded extends CommentState {}
