import 'package:flutter/material.dart';

const _beginTween = Offset(0.0, -1.0);

class RouteAnimations {
  static Route slidingDownRoute(
      {required Widget child,
      required String route,
      Cubic curve = Curves.ease,
      Offset begin = _beginTween,
      Offset end = Offset.zero}) {
    return PageRouteBuilder(
        pageBuilder: ((context, animation, secondaryAnimation) => child),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }
}
