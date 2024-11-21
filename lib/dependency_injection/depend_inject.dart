import 'package_export.dart';
import 'package:http/http.dart' as http;

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
