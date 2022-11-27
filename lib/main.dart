import 'dart:async';

import 'package:collector/config.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:collector/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZoned(() async {
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
