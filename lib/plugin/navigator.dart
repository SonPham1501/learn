import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:learn/config/constant.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get getContext => navigatorKey.currentState!.overlay!.context;

  Future navigateTo(String routeName) => navigatorKey.currentState!.pushNamed(routeName);

  Future navigatePushAndRemoveUntil(String routeName) => navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => false);

  void showNetwork() async {
    if (Constant.isShowingDialog) return;

    Constant.isShowingDialog = true;

    Widget okButton = ElevatedButton(
      onPressed: () async {
        Phoenix.rebirth(getContext);
      },
      child: Text('Retry'),
    );

    showDialog(
      context: getContext,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: AlertDialog(
            title: Text('Error'),
            content: Text('Please check connection'),
            actions: [okButton],
          ),
        ),
      ),
    );
  }
}
