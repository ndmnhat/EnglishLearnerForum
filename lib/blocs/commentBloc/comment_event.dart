import 'package:equatable/equatable.dart';
import 'package:EnglishLearnerForum/model/comment.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class LoadComments extends CommentEvent {}

class AddComment extends CommentEvent {
  final Comment comment;

  const AddComment(this.comment);

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'AddTodo { todo: $comment }';
}

class UpdateComment extends CommentEvent {
  final Comment updatedComment;

  const UpdateComment(this.updatedComment);

  @override
  List<Object> get props => [updatedComment];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedComment }';
}

class DeleteComment extends CommentEvent {
  final Comment comment;

  const DeleteComment(this.comment);

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'DeleteTodo { todo: $comment }';
}

class CommentsUpdated extends CommentEvent {
  final List<Comment> comments;

  const CommentsUpdated(this.comments);

  @override
  List<Object> get props => [comments];
}
