

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/home/home.dart';
import 'package:untitled1/screens/login.dart';
import 'package:untitled1/screens/main_home.dart';
import 'package:untitled1/screens/product%20screen.dart';
import 'package:untitled1/screens/profile.dart';
import 'package:untitled1/screens/register/register.dart';

import 'const/product.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args=settings.arguments;
    switch (settings.name){
      case Register.route:
        return MaterialPageRoute(builder: (context)=>const Register());
      case DrashBoard.route:
        return MaterialPageRoute(builder: (context)=>const DrashBoard());
      case Login.route:
        return MaterialPageRoute(builder: (context)=>const Login());
      case Home.route:
        return MaterialPageRoute(builder: (context)=>const Home());
      case Profile.route:
        return MaterialPageRoute(builder: (context)=>const Profile());
      case ProductScreen.route:
        return MaterialPageRoute(builder: (context)=>ProductScreen(product:args as Product ));
      default:
        return MaterialPageRoute(builder: (context)=>const MaterialApp(home:Center(child: Text("Problem"),),));



    }

  }
}