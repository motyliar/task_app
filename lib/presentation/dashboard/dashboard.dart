import 'package:flutter/material.dart';
import 'package:task_app/core/l10n/l10n.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(child: Text(l10n.language)),
    );
  }
}
