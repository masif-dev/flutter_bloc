part of 'posts_bloc_bloc.dart';

@immutable
sealed class PostsBlocState {}

class InitialState extends PostsBlocState {}

class LoadingState extends PostsBlocState {}

class LoadedState extends PostsBlocState {
  final List<Posts> postsList;
  LoadedState({required this.postsList});
}

class ErrorState extends PostsBlocState {
  final String message;
  ErrorState({required this.message});
}
