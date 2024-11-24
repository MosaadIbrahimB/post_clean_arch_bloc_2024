import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/config/route/app_route.dart';
import 'package:post_2024/core/widget/loading_widget.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_bloc.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_state.dart';

import '../../../core/utils/snakbar_mssage.dart';
import '../widget/add_widget/form_widget.dart';

class AddUpdateScreen extends StatelessWidget {
  final bool isUpdate;
  final PostEntity? postEntity;

  const AddUpdateScreen({super.key, this.isUpdate = false, this.postEntity});

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
        isUpdate ? "Update" : "Add",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _body() {
    return BlocConsumer<AddDeleteUpdatePost, AddDeleteUpdateState>(
      listener: (context, state) {
        if (state is SuccessAddUpdateDeleteState) {
       Navigator.pushNamed(context, AppRoute.homeScreen);
       SnakeBarMessage.succeedMsg(context);
        }
        if (state is ErrorAddUpdateDeleteState) {
          SnakeBarMessage.failMsg(context);
        }

      },
      builder: (context, state) {
        if (state is LoadingAddUpdateDeleteState) {
          return const LoadingWidget();
        }
        return const FormWidget();
      },
    );
  }
}
