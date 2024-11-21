import 'package:equatable/equatable.dart';

import '../../../domain/entity/post_entity.dart';

abstract class AddDeleteUpdateEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddEvent extends AddDeleteUpdateEvent{
  final  PostEntity post;

  AddEvent({required this.post});
  @override
  List<Object?> get props => [post];
}


class DeleteEvent extends AddDeleteUpdateEvent{
  final  int postId;

  DeleteEvent({required this.postId});

  @override
  List<Object?> get props => [postId];
}



class UpdateEvent extends AddDeleteUpdateEvent{
  final   PostEntity post;

  UpdateEvent({required this.post});
@override
List<Object?> get props=>[post];
}