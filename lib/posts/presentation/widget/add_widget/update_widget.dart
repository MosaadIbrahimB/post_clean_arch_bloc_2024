import 'package:flutter/material.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';

import '../../../../config/route/app_route.dart';
import 'btn_icon_widget.dart';
class UpdateWidget extends StatelessWidget {
final PostEntity postEntity;
  const UpdateWidget({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return  BtnIconWidget(
      label: "Edit",
      function: () {
        Navigator.pushNamed(context, AppRoute.addScreen,
            arguments: postEntity);
      },
      icon: Icons.edit,
      color: Colors.blue,
    );
  }
}
