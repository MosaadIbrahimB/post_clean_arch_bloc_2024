import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route/app_route.dart';
import '../../../../core/utils/snakbar_mssage.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../logic/add_delete_update_post/add_delete_update_bloc.dart';
import '../../logic/add_delete_update_post/add_delete_update_state.dart';
import 'alert_dialog_widget.dart';
import 'btn_icon_widget.dart';
class DeleteWidget extends StatelessWidget {
final  int postId;
  const DeleteWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return   BtnIconWidget(
        label: "Delete",
        function: () {
      _delete(context: context, postId:postId );
    },
        icon: Icons.delete,
        color: Colors.red,
    );
  }



_delete({required BuildContext context, required int postId}) {
  showDialog(
    context: context,
    builder: (context) {
      return BlocConsumer<AddDeleteUpdatePost, AddDeleteUpdateState>(
        listener: (context, state) {
          if (state is SuccessAddUpdateDeleteState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.homeScreen, (route) => false);
            SnakeBarMessage.succeedMsg(context: context, msg: state.msg);
          }

          if (state is ErrorAddUpdateDeleteState) {
            Navigator.pop(context);
            SnakeBarMessage.failMsg(context: context, msg: state.msg);
          }
        },
        builder: (context, state) {
          if (state is LoadingAddUpdateDeleteState) {
            return const AlertDialog(
              title: LoadingWidget(),
            );
          }
          return AlertDialogWidget(
            postId:postId ,
          );
        },
      );
    },
  );
}
}
