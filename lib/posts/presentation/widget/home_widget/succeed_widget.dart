import 'package:flutter/material.dart';
import 'package:post_2024/config/route/app_route.dart';
import 'package:post_2024/posts/presentation/widget/home_widget/separated_widget.dart';

import '../../../domain/entity/post_entity.dart';

class SucceedWidget extends StatelessWidget {
  final List<PostEntity> list;

  const SucceedWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) => const SeparatedWidget(),
      itemBuilder: (context, index) => ListTile(
        leading: Text(
          list[index].id.toString() ?? "",
          style: const TextStyle(fontSize: 18),
        ),
        title: Text(
          list[index].title ?? "",
          style: const TextStyle(fontSize: 22),
        ),
        subtitle: Text(list[index].body ?? "",
            style: const TextStyle(fontSize: 18, color: Colors.black26)),
        onTap: (){
          Navigator.pushNamed(context, AppRoute.postDetailsScreen,arguments: list[index]);
        },
      ),
    );
  }
}
