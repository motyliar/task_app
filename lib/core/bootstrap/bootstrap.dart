import 'package:flutter/material.dart';
import 'dart:async';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(await builder());
}
