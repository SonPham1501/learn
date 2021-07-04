
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/modules/home/home_screen.dart';

class Routes{
  static const String INITIAL = '/';

  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case INITIAL:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }

}