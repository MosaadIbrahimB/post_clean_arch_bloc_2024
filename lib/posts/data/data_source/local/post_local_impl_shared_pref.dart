import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:post_2024/core/error/exception.dart';
import 'package:post_2024/posts/data/data_source/local/post_local_data_source.dart';
import 'package:post_2024/posts/data/model/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostLocalImplSharedPref implements PostsLocalDataSource {
  SharedPreferences sharedPreferences;

  PostLocalImplSharedPref({required this.sharedPreferences});

  final String cachedKey = "listModel";

  @override
  Future<Unit> cachedPost(List<PostModel> post) {
    List<Map<String, dynamic>> jsonList = post.map((e) => e.toJson()).toList();
    String stringList = jsonEncode(jsonList);
    sharedPreferences.setString(cachedKey, stringList);

    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCached() {
    String? stringList = sharedPreferences.getString(cachedKey);
    if (stringList != null) {
      List<Map<String, dynamic>> jsonList = jsonDecode(stringList);
      List<PostModel> listPost = jsonList
          .map(
            (e) => PostModel.fromJson(e),
          )
          .toList();
      return Future.value(listPost);
    } else {
      throw EmptyCacheException();
    }
  }
}
