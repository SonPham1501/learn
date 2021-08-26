import 'package:flutter/material.dart';
import 'package:learn/plugin/dio.dart';
import 'package:learn/routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String test = 'test';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              navigationService.navigateTo(RouteName.second);
            },
            child: Text('to'),
          ),
        ],
      ),
    );
  }
}
