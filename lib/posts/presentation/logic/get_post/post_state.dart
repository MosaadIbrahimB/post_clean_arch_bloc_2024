


import 'package:equatable/equatable.dart';

import '../../../domain/entity/post_entity.dart';

abstract class PostState extends Equatable{
  @override
  List<Object?> get props=>[];
}

 class PostInitial extends PostState {}
 class LoadingState extends PostState {}
 class SucceedState extends PostState {
   final   List<PostEntity> post;

   SucceedState({required this.post});
   @override
   List<Object?> get props=>[post];

 }
 class ErrorState extends PostState {
   final  String msg;

  ErrorState({required this.msg});
  @override
  List<Object?> get props=>[msg];
}
