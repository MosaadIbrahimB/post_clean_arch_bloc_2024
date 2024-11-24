import 'package:flutter/material.dart';
import 'package:post_2024/posts/presentation/view/add_update_screen.dart';
import 'package:post_2024/posts/presentation/view/home_screen.dart';



class AppRoute{
static const String homeScreen="/";
static const String addScreen="/add";


  static Route<dynamic>onGenerateRoute(RouteSettings route){
    switch(route.name){

      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen()) ;
      case addScreen:
        return MaterialPageRoute(builder: (context) => const AddUpdateScreen(),);
      default:return _defaultRout();

    }

  }


static _defaultRout(){
  return MaterialPageRoute(builder: (context) => const Scaffold(
    body: Center(child: Text("Default Screen",style: TextStyle(fontSize: 28),),),
  )) ;

}
}