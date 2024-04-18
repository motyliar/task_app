import 'package:flutter/material.dart';
import 'package:task_app/core/services/get_it/get_init.dart';
import 'dart:async';

import 'package:task_app/core/services/hive_init.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit().init();
  GetItInit.initLocators();

  runApp(await builder());
}
