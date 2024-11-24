import 'package:flutter/material.dart';
class TextFormWidget extends StatelessWidget {
  final TextEditingController control;
  final String name;
  final bool? line;

  const TextFormWidget(
      {super.key,
        required this.control,
        required this.name,
        this.line = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      decoration: InputDecoration(
          hintText: name,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
          border: const OutlineInputBorder()),
      validator: (value) => value!.isEmpty ? "Must Enter $name " : null,
      maxLines: line == true ? 6 : 1,
      minLines: line == true ? 6 : 1,
    );
  }
}
