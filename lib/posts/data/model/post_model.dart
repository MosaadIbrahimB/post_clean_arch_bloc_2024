import 'package:dartz/dartz.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json["id"], title: json["title"], body: json["body"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "body": body};
  }
}
