import 'package:dartz/dartz.dart';
import 'package:post_2024/posts/domain/repository/posts_repository.dart';

import '../../../core/error/failure.dart';
import '../entity/post_entity.dart';

class GetAllPost{

  PostsRepository postsRepository;

  GetAllPost(this.postsRepository);

  Future<Either<Failure,List<PostEntity>>>  call()async{
    return await postsRepository.getAllPost();
  }
}