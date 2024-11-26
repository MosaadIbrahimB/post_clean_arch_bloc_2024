import 'package:flutter/material.dart';
import 'package:post_2024/posts/domain/entity/post_entity.dart';
import 'package:post_2024/posts/presentation/view/add_update_screen.dart';
import 'package:post_2024/posts/presentation/view/home_screen.dart';

import '../../posts/presentation/view/post_details_screen.dart';



class AppRoute{
static const String homeScreen="/";
static const String addScreen="/add";
static const String postDetailsScreen="/postDetails";


  static Route<dynamic>onGenerateRoute(RouteSettings route){
    switch(route.name){

      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen()) ;
      case addScreen:
         PostEntity? postEntity=route.arguments as PostEntity ?;
        return MaterialPageRoute(builder: (context) =>  AddUpdateScreen(postEntity: postEntity,),);
      case postDetailsScreen:
        {
          final PostEntity post=route.arguments as PostEntity;

        return  MaterialPageRoute(builder: (context) =>  PostDetailsScreen(postEntity:post ,));
        }
      default:return _defaultRout();

    }

  }


static _defaultRout(){
  return MaterialPageRoute(builder: (context) => const Scaffold(
    body: Center(child: Text("Default Screen",style: TextStyle(fontSize: 28),),),
  )) ;

}
}