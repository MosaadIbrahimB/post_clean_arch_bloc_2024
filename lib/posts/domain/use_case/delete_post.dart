import 'package:dartz/dartz.dart';
import 'package:post_2024/posts/domain/repository/posts_repository.dart';

import '../../../core/error/failure.dart';
import '../entity/post_entity.dart';

class DeletePost{

  PostsRepository postsRepository;

  DeletePost(this.postsRepository);

  Future<Either<Failure,Unit>>  call(int postId)async{
    return await postsRepository.deletePost(postId);
  }
}