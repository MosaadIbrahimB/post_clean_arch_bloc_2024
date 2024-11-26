import 'package:flutter/material.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';
import '../widget/add_widget/delete_widget.dart';
import '../widget/add_widget/update_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  final PostEntity postEntity;

  const PostDetailsScreen({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context)
    );
  }

  _appBar() {
    return AppBar(
      title: const Text(
        "Post Details ",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }

  _body(BuildContext context){
    return Center(
      child: Container(
        margin: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              postEntity.title,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              postEntity.body,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UpdateWidget(postEntity: postEntity),
                DeleteWidget(postId: postEntity.id??0),
              ],
            )
          ],
        ),
      ),
    );
  }

}

