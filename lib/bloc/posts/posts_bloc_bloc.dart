import 'package:bloc/bloc.dart';
import 'package:bloc_sample/models/posts_model.dart';
import 'package:bloc_sample/repositories/posts_repo.dart';
import 'package:meta/meta.dart';

part 'posts_bloc_event.dart';
part 'posts_bloc_state.dart';

class PostsBlocBloc extends Bloc<PostsBlocEvent, PostsBlocState> {
  PostsBlocBloc() : super(InitialState()) {
    on<FetchDataEvent>(_fetchData);
    on<DeleteSinglePostEvent>(_deletePostData);
  }
  Future<void> _fetchData(
      FetchDataEvent event, Emitter<PostsBlocState> emit) async {
    emit(LoadingState());
    try {
      final posts = await PostsRepo.fetchDataFromApi();
      emit(LoadedState(postsList: posts));
    } catch (e) {
      emit(ErrorState(message: 'Failed to fetch data'));
    }
  }


  Future<void> _deletePostData(
      DeleteSinglePostEvent event, Emitter<PostsBlocState> emit) async {
    emit(LoadingState());
    try {
      List<Posts> postsList = event.posts;
      postsList.removeWhere((post) => post.id.toString() == event.postId);
      emit(LoadedState(postsList: postsList));
    } catch (e) {
      emit(ErrorState(message: 'Failed to fetch data'));
    }
  }
}
