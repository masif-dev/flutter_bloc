import 'package:bloc_sample/bloc/comments/comments_bloc.dart';
import 'package:bloc_sample/bloc/posts/posts_bloc_bloc.dart';
import 'package:bloc_sample/screens/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Use MultiBlocProvider for multiple BLoCs
      providers: [
        BlocProvider<PostsBlocBloc>(
          create: (context) => PostsBlocBloc(),
        ),
        BlocProvider<CommentsBloc>(
          create: (context) => CommentsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: const HomeScreen(),
      ),
    );
  }
}

/*
Single Bloc Class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBlocBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: const HomeScreen(),
      ),
    );
  }
}

 */