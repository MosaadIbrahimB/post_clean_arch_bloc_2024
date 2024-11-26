import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/posts/presentation/widget/home_widget/succeed_widget.dart';

import '../../../../core/widget/loading_widget.dart';
import '../../logic/get_post/post_bloc.dart';
import '../../logic/get_post/post_event.dart';
import '../../logic/get_post/post_state.dart';
import 'fail_widget.dart';
class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const LoadingWidget();
        }
        if (state is SucceedState) {
          return  RefreshIndicator(
              onRefresh:()=> _refresh(context),

              child: SucceedWidget(list: state.post));
        }
        if (state is ErrorState) {
          return FailWidget(msg: state.msg);
        }

        return const Center(
          child: Text("Default data"),
        );
      },
    );
  }
  Future<void> _refresh(BuildContext context)async{

    BlocProvider.of<PostBloc>(context).add(RefreshEvent());
  }
}
