import 'package:flutter/material.dart';
class BtnIconWidget extends StatelessWidget {
  final void Function() function;
  final Color? color;
  final String label;
  final IconData? icon;

  const BtnIconWidget(
      {super.key,
        required this.function,
        this.color,
        this.icon,
        required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: () {
        function();
      },
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
