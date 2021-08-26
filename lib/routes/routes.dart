
import 'package:flutter/material.dart';
import 'package:learn/routes/route_name.dart';
import 'package:learn/screens/home/home_screen.dart';
import 'package:learn/screens/second/second_screen.dart';

abstract class Routes {
  static Route onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.second:
        return MaterialPageRoute(builder: (context) => SecondScreen());
      default:
        throw 'No Page';
    }
  }
}