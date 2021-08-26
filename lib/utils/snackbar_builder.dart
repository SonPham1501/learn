import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn/plugin/dio.dart';

abstract class SnackBarBuilder {
  static void showSnackBar({required String content, bool status = false}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: status
          ? Theme.of(navigationService.getContext).buttonColor
          : Theme.of(navigationService.getContext).errorColor,
      textColor: Colors.white,
      fontSize: 14,
    );
  }
}
