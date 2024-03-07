part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  List<Comments> commentsList;
  CommentsLoaded(this.commentsList);
}

class CommentsError extends CommentsState {
  String error;
  CommentsError(this.error);
}
