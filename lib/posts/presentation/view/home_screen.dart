import 'package:flutter/material.dart';
import 'package:post_2024/config/route/app_route.dart';
import '../widget/home_widget/body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Scaffold(
        appBar: _appBar(),
        body: const BodyWidget(),
        floatingActionButton: _floatingActionButton(context),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: const Text(
        "Post",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),

    );
  }

  _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      shape: const StadiumBorder(),
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.addScreen);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
