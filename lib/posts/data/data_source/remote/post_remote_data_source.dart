import 'package:dartz/dartz.dart';
import 'package:post_2024/posts/data/model/post_model.dart';

abstract class PostsRemoteDataSource {

Future<List<PostModel>> getPost();
Future<Unit> deletePost(int postId);
Future<Unit> addPost(PostModel postModel);
Future<Unit> updatePost(PostModel postModel);

}
