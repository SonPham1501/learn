import 'package:flutter/material.dart';
import 'package:learn/plugin/dio.dart';
import 'package:learn/routes/route_name.dart';
import 'package:learn/services/default_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await DefaultService().getCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('can you here me'),
        ],
      ),
    );
  }
}
