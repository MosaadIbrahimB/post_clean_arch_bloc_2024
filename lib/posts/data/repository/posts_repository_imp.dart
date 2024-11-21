import 'package:dartz/dartz.dart';
import 'package:post_2024/core/error/exception.dart';
import 'package:post_2024/core/error/failure.dart';
import 'package:post_2024/core/network/network_info.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';
import '../../domain/repository/posts_repository.dart';
import '../data_source/local/post_local_data_source.dart';
import '../data_source/remote/post_remote_data_source.dart';
import '../model/post_model.dart';

class PostsRepositoryImp implements PostsRepository {
  PostsRemoteDataSource postsRemoteDataSource;
  PostsLocalDataSource postsLocalDataSource;
  NetworkInfo networkInfo;

  PostsRepositoryImp(
      {required this.postsRemoteDataSource,
      required this.postsLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPost() async {
    if (await networkInfo.isConnection()) {
      try {
        final post = await postsRemoteDataSource.getPost();
        await postsLocalDataSource.cachedPost(post);
        return right(post);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final post = await postsLocalDataSource.getCached();
        return right(post);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity post) async{
    PostModel postModel=PostModel(id: post.id, title: post.title, body:post. body);
    return await _deleteUpdateAdd(()async =>  await postsRemoteDataSource.addPost(postModel),);
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _deleteUpdateAdd(()async =>  await postsRemoteDataSource.deletePost(postId),);
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity post) async{
    PostModel postModel=PostModel(id: post.id, title: post.title, body:post. body);
    return await _deleteUpdateAdd(()async =>  await postsRemoteDataSource.updatePost(postModel),);

  }

  Future<Either<Failure, Unit>> _deleteUpdateAdd(Future<Unit> Function() function)async{
    if (await networkInfo.isConnection()) {
      try {
        return Right(await function());
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());

    }
  }

}
// if (await networkInfo.isConnection()) {
//   try {
//     return Right(await postsRemoteDataSource.deletePost(postId));
//   } on ServerException {
//     return left(ServerFailure());
//   }
// } else {
//   return left(OfflineFailure());
//
// }