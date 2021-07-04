
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/modules/home/bloc/comment_bloc.dart';
import 'package:learn/modules/home/bloc/comment_event.dart';
import 'package:learn/routes/app_routes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommentBloc>(create: (context) => CommentBloc()..add(CommentFetched())),
      ],
      child: MaterialApp(
        title: 'flutter',
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
