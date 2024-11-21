import 'package:dartz/dartz.dart';
import 'package:post_2024/posts/data/model/post_model.dart';

abstract class PostsLocalDataSource {

Future<List<PostModel>> getCached();
Future<Unit> cachedPost(List<PostModel>post);

}
