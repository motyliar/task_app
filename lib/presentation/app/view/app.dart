import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/router/app_router.dart';
import 'package:task_app/core/services/get_it/task_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/presentation/app/business/cubit/localization_switch_cubit.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => taskLocator<TasksHandlerCubit>()..fetchTasks(),
        ),
        BlocProvider(create: (context) => LocalizationSwitchCubit())
      ],
      child: BlocBuilder<LocalizationSwitchCubit, String>(
        builder: (context, state) {
          return MaterialApp(
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: kDashBoardPage,
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          );
        },
      ),
    );
  }
}
