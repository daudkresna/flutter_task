import 'package:native_bloc_task/data/datasources/post_remote_data_source.dart';
import 'package:native_bloc_task/domain/entities/post_entity.dart';
import 'package:native_bloc_task/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  @override
  Future<List<PostEntity>> getPosts() async {
    final postModels = await postRemoteDataSource.getPosts();

    return postModels.map((postModel) => PostEntity(
      id: postModel.id,
      title: postModel.title,
      body: postModel.body,
    )).toList();
  }
}