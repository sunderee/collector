import 'package:collector/config.dart';
import 'package:collector/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

Future<void> main() async {
  Intl.systemLocale = await findSystemLocale();
  await initializeDependencies();

  runApp(initializeState(const App()));
}
