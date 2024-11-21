import 'package:dartz/dartz.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';

import '../../../core/error/failure.dart';

abstract class PostsRepository {
Future<Either<Failure,List<PostEntity>>> getAllPost();
Future<Either<Failure,Unit>> deletePost(int postId);
Future<Either<Failure,Unit>> updatePost(PostEntity post);
Future<Either<Failure,Unit>> addPost(PostEntity post);
}