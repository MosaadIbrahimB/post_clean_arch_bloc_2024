import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/config/route/app_route.dart';
import 'package:post_2024/core/widget/loading_widget.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_bloc.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_state.dart';

import '../../../core/utils/snakbar_mssage.dart';
import '../logic/add_delete_update_post/add_delete_update_event.dart';
import '../widget/add_widget/form_widget.dart';

class AddUpdateScreen extends StatelessWidget {
  final PostEntity? postEntity;

  const AddUpdateScreen({super.key, this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body:_body(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text(
        postEntity!=null ? "Update" : "Add",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }

  _body() {
    return BlocConsumer<AddDeleteUpdatePost, AddDeleteUpdateState>(
      listener: (context, state) {
        if (state is SuccessAddUpdateDeleteState) {
       Navigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen,(route) => false,);
       SnakeBarMessage.succeedMsg(context: context,msg: state.msg);
        }
        if (state is ErrorAddUpdateDeleteState) {
          SnakeBarMessage.failMsg(context: context,msg: state.msg);
        }

      },
      builder: (context, state) {
        if (state is LoadingAddUpdateDeleteState) {
          return const LoadingWidget();
        }

        return FormWidget(postEntity: postEntity,);
      },
    );
  }
}
/*
    return ElevatedButton(onPressed: (){
          BlocProvider.of<AddDeleteUpdatePost>(context)
              .add(AddEvent(post: PostEntity(title: "s", body: "body")));
        }, child: Text("data"));
 */