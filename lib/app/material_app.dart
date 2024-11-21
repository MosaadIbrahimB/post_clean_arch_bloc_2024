import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_bloc.dart';
import 'package:post_2024/posts/presentation/logic/get_post/post_bloc.dart';
import '../dependency_injection/depend_inject.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<PostBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AddDeleteUpdatePost>(),
        ),
      ],
      child: const MaterialApp(

      ),
    );
  }
}
