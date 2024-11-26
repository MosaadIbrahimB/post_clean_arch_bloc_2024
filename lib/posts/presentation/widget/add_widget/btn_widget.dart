import 'package:flutter/material.dart';

import '../../../domain/entity/post_entity.dart';
class BtnWidget extends StatelessWidget {
  final PostEntity? postEntity;


  const BtnWidget({super.key, this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .35),
      color: Colors.blue,
      child:   Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              postEntity==null?  Icons.add:Icons.edit,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              postEntity==null? "Add":"Edit",
              style:const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
