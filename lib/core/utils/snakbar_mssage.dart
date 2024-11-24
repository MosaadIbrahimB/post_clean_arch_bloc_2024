
import 'package:flutter/material.dart';

class SnakeBarMessage{

static  void succeedMsg(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
          "succeed add post ", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,));
  }

static void failMsg(BuildContext context){
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
          "fail add post ", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.red,));
  }
}