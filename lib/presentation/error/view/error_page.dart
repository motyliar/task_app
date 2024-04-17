import 'package:flutter/material.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/router/route_animation.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  static Route route() {
    return RouteAnimations.slidingDownRoute(
        child: const ErrorPage(), route: kErrorPage);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
