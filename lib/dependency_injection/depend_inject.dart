import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../core/network/network_info.dart';
import '../posts/data/data_source/local/post_local_data_source.dart';
import '../posts/data/data_source/local/post_local_impl_shared_pref.dart';
import '../posts/data/data_source/remote/post_remote_data_source.dart';
import '../posts/data/data_source/remote/post_remote_impl_http.dart';
import '../posts/data/repository/posts_repository_imp.dart';
import '../posts/domain/repository/posts_repository.dart';
import '../posts/domain/use_case/add_post.dart';
import '../posts/domain/use_case/delete_post.dart';
import '../posts/domain/use_case/get_all_post.dart';
import '../posts/domain/use_case/update_post.dart';
import '../posts/presentation/logic/add_delete_update_post/add_delete_update_bloc.dart';
import '../posts/presentation/logic/get_post/post_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///bloc
  sl.registerFactory(() => PostBloc(getAllPost: sl()));
  sl.registerFactory(() =>
      AddDeleteUpdatePost(addPost: sl(), deletePost: sl(), updatePost: sl()));

  ///useCase
  sl.registerLazySingleton(() => AddPost(sl()));
  sl.registerLazySingleton(() => DeletePost(sl()));
  sl.registerLazySingleton(() => GetAllPost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));

  ///repository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImp(
      networkInfo: sl(),
      postsLocalDataSource: sl(),
      postsRemoteDataSource: sl()));

  ///data source
  sl.registerLazySingleton<PostsLocalDataSource>(
      () => PostLocalImplSharedPref(sharedPreferences: sl()));
  sl.registerLazySingleton<PostsRemoteDataSource>(
      () => PostRemoteImplHttp(client: sl()));

  ///core
  //network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Package
  //internet checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
  //sharePref
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //http
  sl.registerLazySingleton(() => http.Client());
}
