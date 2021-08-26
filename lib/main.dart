import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/config/env_config.dart';
import 'package:learn/plugin/dio.dart';
import 'package:learn/plugin/locator.dart';
import 'package:learn/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  EnvConfig.setEnvironment(Environment.DEV);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
