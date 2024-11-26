
import 'package:flutter/material.dart';

class SnakeBarMessage{


 static  void succeedMsg({required BuildContext context, String? msg}){
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(msg??"", style:const TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,));
  }

static void failMsg({required BuildContext context, String? msg}){
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(
          msg??"", style:const TextStyle(color: Colors.white),),
          backgroundColor: Colors.red,));
  }
}