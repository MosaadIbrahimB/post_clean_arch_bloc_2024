import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/add_delete_update_post/add_delete_update_bloc.dart';
import '../../logic/add_delete_update_post/add_delete_update_event.dart';

class AlertDialogWidget extends StatelessWidget {
  final int postId;

  const AlertDialogWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure delete", textAlign: TextAlign.center),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No")),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AddDeleteUpdatePost>(context)
                      .add(DeleteEvent(postId: postId));
                },
                child: const Text("Yes")),
          ],
        )
      ],
    );
  }
}
