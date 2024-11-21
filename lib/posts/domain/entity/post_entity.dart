import 'package:equatable/equatable.dart';

class PostEntity extends Equatable{
  int id;
  String title;
  String body;

  PostEntity({required this.id, required this.title, required this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,body];
}
