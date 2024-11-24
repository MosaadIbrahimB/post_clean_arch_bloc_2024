import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/posts/presentation/logic/get_post/post_event.dart';
import 'package:post_2024/posts/presentation/logic/get_post/post_state.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/entity/post_entity.dart';
import '../../../domain/use_case/get_all_post.dart';



class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPost getAllPost;

  PostBloc({required this.getAllPost}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is GetPostEvent) {
        emit(LoadingState());
        Either<Failure, List<PostEntity>> response = await getAllPost();
        emit(_getState(response));
      }

      if (event is RefreshEvent) {

        emit(LoadingState());
        await Future.delayed(const Duration(seconds: 2));
        Either<Failure, List<PostEntity>> response = await getAllPost();
        emit(_getState(response));
      }
    });
  }

  PostState _getState(Either<Failure, List<PostEntity>> response) {
    return response.fold(
      (failure) => ErrorState(msg: _getStringFailure(failure)),
      (post) => SucceedState(post: post),
    );
  }

  String _getStringFailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      case EmptyCacheFailure:
        return "EmptyCacheFailure";
      case OfflineFailure:
        return "OfflineFailure";
      default:
        return "UnKnow Failure , Try again ";
    }
  }
}
