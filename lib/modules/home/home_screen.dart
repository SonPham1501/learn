import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/data/result_model/result_get_comment.dart';
import 'package:learn/modules/home/bloc/comment_bloc.dart';
import 'package:learn/modules/home/bloc/comment_event.dart';
import 'package:learn/modules/home/bloc/comment_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CommentBloc commentBloc = BlocProvider.of<CommentBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentFetchSuccess) {
              return ListView.builder(
                  itemCount: state.comments.length,
                  itemBuilder: (context, index) {
                    ResultGetComment comment = state.comments[index];
                    return ListTile(
                      leading: Text(comment.id!.toString()),
                      title: Text(comment.email!),
                      subtitle: Text(comment.body!),
                      isThreeLine: true,
                    );
                  });
            }
            return InkWell(
              onTap: (){
                commentBloc.add(CommentFetched());
              },
              child: Center(child: CupertinoActivityIndicator(radius: 15)),
            );
          },
        ),
      ),
    );
  }
}
