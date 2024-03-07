import 'package:bloc_sample/bloc/comments/comments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/comments.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    context.read<CommentsBloc>().add(LoadComments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CommentsError) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is CommentsLoaded) {
            return ListView.builder(
                itemCount: state.commentsList.length,
                itemBuilder: (context, index) {
                  Comments comments = state.commentsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          comments.name ?? '',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(comments.body ?? ''),
                      ),
                    ),
                  );
                });
          }

          return const SizedBox();
        },
      ),
    );
  }
}
