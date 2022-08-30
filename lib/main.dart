import 'dart:async';

import 'package:collector/config.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:collector/ui/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

void main() {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Loggy.initLoggy(
      logOptions: const LogOptions(
        kReleaseMode ? LogLevel.off : LogLevel.all,
        stackTraceLevel: kReleaseMode ? LogLevel.off : LogLevel.error,
        includeCallerInfo: !kReleaseMode,
      ),
    );

    await initializeDependencies();
    runApp(
      BlocProvider<MeasurementCubit>(
        create: (_) => MeasurementCubit(const MeasurementState.loading())
          ..fetchMeasurements(),
        child: const App(),
      ),
    );
  });
}
