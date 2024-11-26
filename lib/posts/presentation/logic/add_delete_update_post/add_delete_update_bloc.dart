import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/posts/domain/use_case/add_post.dart';
import 'package:post_2024/posts/domain/use_case/delete_post.dart';
import 'package:post_2024/posts/domain/use_case/update_post.dart';

import '../../../../core/error/failure.dart';
import 'add_delete_update_event.dart';
import 'add_delete_update_state.dart';

class AddDeleteUpdatePost
    extends Bloc<AddDeleteUpdateEvent, AddDeleteUpdateState> {
  final AddPost addPost;
  final DeletePost deletePost;
  final UpdatePost updatePost;

  AddDeleteUpdatePost(
      {required this.addPost,
      required this.deletePost,
      required this.updatePost})
      : super(InitialAddUpdateDeleteState()) {
    on(
      (event, emit) async {
        if (event is AddEvent) {
          emit(LoadingAddUpdateDeleteState());
          Either<Failure, Unit> response = await addPost(event.post);
          emit(_getState(response, " Add post"));
        }
        if (event is UpdateEvent) {
          emit(LoadingAddUpdateDeleteState());
          Either<Failure, Unit> response = await updatePost(event.post);
          emit(_getState(response, " Update post"));
        }
        if (event is DeleteEvent) {
          emit(LoadingAddUpdateDeleteState());
          Either<Failure, Unit> response = await deletePost(event.postId);
          emit(_getState(response, " Delete post"));
        }
      },
    );
  }

  AddDeleteUpdateState _getState(Either<Failure, Unit> response, String msg) {
    return response.fold(
      (failure) => ErrorAddUpdateDeleteState(msg: _getStringFailure(failure)),
      (post) => SuccessAddUpdateDeleteState(msg: msg),
    );
  }

  String _getStringFailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      case OfflineFailure:
        return "Offline Internet";
      default:
        return "UnKnow Failure , Try again ";
    }
  }
}
