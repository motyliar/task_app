import 'package:flutter/material.dart';
import 'dart:async';

import 'package:task_app/core/services/hive_init.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveInit().init();

  runApp(await builder());
}
