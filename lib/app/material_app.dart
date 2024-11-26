import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_bloc.dart';
import 'package:post_2024/posts/presentation/logic/get_post/post_bloc.dart';
import '../config/route/app_route.dart';
import '../dependency_injection/depend_inject.dart' as di;
import '../posts/presentation/logic/get_post/post_event.dart';
import '../posts/presentation/view/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.sl<PostBloc>()..add(GetPostEvent())),
        BlocProvider(
          create: (context) => di.sl<AddDeleteUpdatePost>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.homeScreen,
        onGenerateRoute: AppRoute.onGenerateRoute,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.blue,
                iconTheme: IconThemeData(color: Colors.white))),
      ),
    );
  }
}
