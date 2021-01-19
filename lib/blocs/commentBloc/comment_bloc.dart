import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:EnglishLearnerForum/repositories/comment_repository.dart';
import 'package:EnglishLearnerForum/blocs/commentBloc/comment.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository _commentRepository;
  CommentBloc({@required commentRepository})
      : assert(commentRepository != null),
        _commentRepository = commentRepository,
        super(CommentsLoading());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is LoadComments) {
      yield* _mapLoadCommentsToState();
    } else if (event is AddComment) {
      yield* _mapAddCommentToState(event);
    } else if (event is UpdateComment) {
      yield* _mapUpdateCommentToState(event);
    } else if (event is DeleteComment) {
      yield* _mapDeleteCommentToState(event);
    } else if (event is CommentsUpdated) {
      yield* _mapCommentsUpdatedToState(event);
    }
  }

  Stream<CommentState> _mapLoadCommentsToState() async* {
    _commentRepository.getAllComments().listen(
          (comments) => add(CommentsUpdated(comments)),
        );
  }

  Stream<CommentState> _mapAddCommentToState(AddComment event) async* {
    _commentRepository.addNewComment(event.comment);
  }

  Stream<CommentState> _mapUpdateCommentToState(UpdateComment event) async* {
    _commentRepository.updateComment(event.updatedComment);
  }

  Stream<CommentState> _mapDeleteCommentToState(DeleteComment event) async* {
    _commentRepository.deleteComment(event.comment);
  }

  Stream<CommentState> _mapCommentsUpdatedToState(
      CommentsUpdated event) async* {
    yield CommentsLoaded(event.comments);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
