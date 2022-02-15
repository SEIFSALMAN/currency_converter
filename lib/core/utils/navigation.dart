import 'package:flutter/material.dart';

class AppNavigator {
  static customNavigator({context, screen, required bool finish}) {
    finish
        ? Navigator.pushAndRemoveUntil(context,
      PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 900),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.center,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return screen;
          }),(route) => false,)

        : Navigator.pushAndRemoveUntil(context,
      PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 900),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.center,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return screen;
          }),(route) => true,);;
  }
}
