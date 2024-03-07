import 'package:bloc/bloc.dart';
import 'package:bloc_sample/repositories/posts_repo.dart';
import 'package:meta/meta.dart';

import '../../models/comments.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<LoadComments>(fetchComments);
  }
  fetchComments(LoadComments event, Emitter<CommentsState> emit) async {
    emit(CommentsLoading());
    try {
      List<Comments> comments = await PostsRepo.fetchComments();
      emit(CommentsLoaded(comments));
    } catch (e) {
      emit(CommentsError("Error occur while fetching comments"));
    }
  }
}
