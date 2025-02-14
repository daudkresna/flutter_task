import 'package:dio/dio.dart';
import 'package:native_bloc_task/data/models/post_model.dart';

class PostRemoteDataSource {
  final Dio dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getPosts() async {
    final response = await dio.get(baseUrl);
    final List<PostModel> posts = [];

    for (var post in response.data) {
      posts.add(PostModel.fromJson(post));
    }

    return posts;
  }
}
