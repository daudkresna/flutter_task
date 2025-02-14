import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:native_bloc_task/domain/entities/post_entity.dart';
import 'package:native_bloc_task/domain/usecases/get_post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPost getPost;
  PostsBloc({required this.getPost}) : super(PostsInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      final posts = await getPost();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }
}
