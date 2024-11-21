import 'package:dartz/dartz.dart';
import 'package:post_2024/posts/domain/repository/posts_repository.dart';

import '../../../core/error/failure.dart';
import '../entity/post_entity.dart';

class AddPost{

  PostsRepository postsRepository;

  AddPost(this.postsRepository);

  Future<Either<Failure,Unit>> call(PostEntity post) async{
    return await postsRepository.addPost(post);
  }
}