import 'package:equatable/equatable.dart';

class PostEntity extends Equatable{
  int ?id;
  String title;
  String body;

  PostEntity({ this.id, required this.title, required this.body});

  @override
  List<Object?> get props => [id,title,body];
}
