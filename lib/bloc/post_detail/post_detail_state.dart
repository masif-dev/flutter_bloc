part of 'post_detail_bloc.dart';
@immutable
abstract class PostDetailState {}

class PostDetailInitial extends PostDetailState {}

class InitialState extends PostDetailState {}

class LoadingState extends PostDetailState {}

class PostLoadedState extends PostDetailState {
  final Posts posts;
  PostLoadedState({required this.posts});
}

class ErrorState extends PostDetailState {
  final String message;
  ErrorState({required this.message});
}
