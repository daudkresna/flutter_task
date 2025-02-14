import 'package:native_bloc_task/domain/entities/post_entity.dart';
import 'package:native_bloc_task/domain/repositories/post_repository.dart';

class GetPost {
  final PostRepository _postRepository;

  GetPost(this._postRepository);

  Future<List<PostEntity>> call() async {
    return await _postRepository.getPosts();
  }
}