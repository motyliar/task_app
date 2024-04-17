import 'package:flutter/material.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/router/route_animation.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static Route route() {
    return RouteAnimations.slidingDownRoute(
        child: const Dashboard(), route: kDashBoardPage);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(child: Text(l10n.language)),
    );
  }
}
