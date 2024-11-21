import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:post_2024/core/error/exception.dart';
import 'package:post_2024/posts/data/data_source/remote/post_remote_data_source.dart';
import 'package:post_2024/posts/data/model/post_model.dart';

class PostRemoteImplHttp implements PostsRemoteDataSource {
  http.Client client;

  PostRemoteImplHttp({required this.client});

  String baseUrl = "https://jsonplaceholder.typicode.com";

  @override
  Future<Unit> addPost(PostModel postModel) async {
    Map<String, String> body = {
      "body": postModel.body,
      "title": postModel.title
    };
    http.Response response =
        await client.post(Uri.parse("$baseUrl/posts/"), body: body);

    if (response.statusCode == 201) {

      return Future.value(unit);

    } else {

      throw ServerException();
    }

  }

  @override
  Future<Unit> deletePost(int postId) async {
    String id = postId.toString();
    http.Response response = await client.delete(
        Uri.parse("$baseUrl/posts/$id"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    String id = postModel.id.toString();

    Map<String, String> body = {
      "body": postModel.body,
      "title": postModel.title
    };
    http.Response response =
        await client.patch(Uri.parse("$baseUrl/posts/$id"), body: body);

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getPost() async {
    http.Response response = await client.get(Uri.parse("$baseUrl/posts/"),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> listJson = jsonDecode(response.body);
      List<PostModel> listPostModel = listJson
          .map(
            (e) => PostModel.fromJson(e),
          )
          .toList();
      return Future.value(listPostModel);
    } else {
      throw ServerException();
    }
  }


}
