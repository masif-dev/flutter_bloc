part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailEvent {}

class FetchSinglePostEvent extends PostDetailEvent {
  String postId;
  FetchSinglePostEvent(this.postId);
}
