import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:EnglishLearnerForum/repositories/post_repository.dart';
import 'package:EnglishLearnerForum/blocs/postBloc/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;
  PostBloc({@required postRepository})
      : assert(postRepository != null),
        _postRepository = postRepository,
        super(PostsLoading());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadPosts) {
      yield* _mapLoadPostsToState();
    } else if (event is AddPost) {
      yield* _mapAddPostToState(event);
    } else if (event is UpdatePost) {
      yield* _mapUpdatePostToState(event);
    } else if (event is DeletePost) {
      yield* _mapDeletePostToState(event);
    } else if (event is PostsUpdated) {
      yield* _mapPostsUpdatedToState(event);
    }
  }

  Stream<PostState> _mapLoadPostsToState() async* {
    _postRepository.getAllPosts().listen(
          (posts) => add(PostsUpdated(posts)),
        );
  }

  Stream<PostState> _mapAddPostToState(AddPost event) async* {
    _postRepository.addNewPost(event.post);
  }

  Stream<PostState> _mapUpdatePostToState(UpdatePost event) async* {
    _postRepository.updatePost(event.updatedPost);
  }

  Stream<PostState> _mapDeletePostToState(DeletePost event) async* {
    _postRepository.deletePost(event.post);
  }

  Stream<PostState> _mapPostsUpdatedToState(PostsUpdated event) async* {
    yield PostsLoaded(event.posts);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
