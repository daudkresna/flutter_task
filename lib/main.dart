import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_bloc_task/data/datasources/post_remote_data_source.dart';
import 'package:native_bloc_task/data/repositories/post_repository_impl.dart';
import 'package:native_bloc_task/domain/usecases/get_post.dart';
import 'package:native_bloc_task/presentation/posts/bloc/posts_bloc.dart';
import 'package:native_bloc_task/presentation/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PostsBloc(
            getPost: GetPost(
              PostRepositoryImpl(postRemoteDataSource: PostRemoteDataSource()),
            ),
          ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('Native Bloc Task')),
          body: WelcomeScreen(),
        ),
      ),
    );
  }
}
