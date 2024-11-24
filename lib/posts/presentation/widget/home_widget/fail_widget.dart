import 'package:flutter/material.dart';
class FailWidget extends StatelessWidget {
  final String msg;

  const FailWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        msg,
        style: const TextStyle(fontSize: 22, color: Colors.black87),
      ),
    );
  }
}
