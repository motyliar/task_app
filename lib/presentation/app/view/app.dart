import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/router/app_router.dart';
import 'package:task_app/core/services/get_it/task_container.dart';
import 'package:task_app/presentation/app/business/cubit/get_tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => taskLocator<GetTasksCubit>()..fetchTasks(),
      child: const MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: kDashBoardPage,
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}
