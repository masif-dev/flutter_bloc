import 'package:bloc_sample/bloc/posts/posts_bloc_bloc.dart';
import 'package:bloc_sample/screens/comments.dart';
import 'package:bloc_sample/screens/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, dynamic>> posts;

  @override
  void initState() {
    super.initState();
    context.read<PostsBlocBloc>().add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CommentsScreen()));
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              context.read<PostsBlocBloc>().add(FetchDataEvent());
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: BlocBuilder<PostsBlocBloc, PostsBlocState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                strokeCap: StrokeCap.round,
              ),
            );
          }

          if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is LoadedState) {
            return ListView.builder(
                itemCount: state.postsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onLongPress: () {
                        context.read<PostsBlocBloc>().add(DeleteSinglePostEvent(
                            posts: state.postsList,
                            postId: state.postsList[index].id.toString()));
                      },
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PostDetailScreen(
                                postId: state.postsList[index].id.toString())));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            '${state.postsList[index].id}-${state.postsList[index].title!}',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(state.postsList[index].body ?? ''),
                        ),
                      ),
                    ),
                  );
                });
          }
          return const Center(child: Text("No State"));
        },
      ),
    );
  }
}
