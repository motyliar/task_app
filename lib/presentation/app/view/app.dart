import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_app/presentation/dashboard/dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Dashboard(),
    );
  }
}
