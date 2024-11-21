import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object?> get props =>[];
}
class RefreshEvent extends PostEvent{

}
class GetPostEvent extends PostEvent{}
