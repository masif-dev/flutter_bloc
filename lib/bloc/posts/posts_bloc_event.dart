part of 'posts_bloc_bloc.dart';

@immutable
sealed class PostsBlocEvent {}

class FetchDataEvent extends PostsBlocEvent {}

class FetchSinglePostEvent extends PostsBlocEvent {
  String postId;
  FetchSinglePostEvent(this.postId);
}

class DeleteSinglePostEvent extends PostsBlocEvent {
  String postId;
  List<Posts> posts;
  DeleteSinglePostEvent({required this.postId, required this.posts});
}
