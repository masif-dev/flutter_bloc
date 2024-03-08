import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/posts_model.dart';
import '../../repositories/posts_repo.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc() : super(PostDetailInitial()) {
    on<FetchSinglePostEvent>(_fetchPostData);
  }
  Future<void> _fetchPostData(
      FetchSinglePostEvent event, Emitter<PostDetailState> emit) async {
    emit(LoadingState());
    try {
      final posts = await PostsRepo.fetchSinglePostFromApi(event.postId);
      emit(PostLoadedState(posts: posts));
    } catch (e) {
      emit(ErrorState(message: 'Failed to fetch data'));
    }
  }
}
