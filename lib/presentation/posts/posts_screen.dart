import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_bloc_task/presentation/posts/bloc/posts_bloc.dart';
import 'package:native_bloc_task/presentation/widgets/post_card.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostsError) {
              return Text(state.message);
            } else if (state is PostsLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PostsBloc>().add(FetchPosts());
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final title = state.posts[index].title;
                    final body = state.posts[index].body;
                    return PostCard(
                      title: title,
                      body: body,
                      index: (index + 1).toString(),
                    );
                  },
                ),
              );
            } else {
              context.read<PostsBloc>().add(FetchPosts());
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
