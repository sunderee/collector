import 'package:collector/data/measurement.model.dart';
import 'package:collector/data/measurement.repository.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  await Hive.initFlutter();
  Hive.registerAdapter<MeasurementModel>(MeasurementModelAdapter());
  final box = await Hive.openBox<MeasurementModel>('measurements');

  getIt.registerSingleton<Box<MeasurementModel>>(box);
  getIt.registerSingleton<IMeasurementRepository>(MeasurementRepository());
}

Widget initializeState(Widget app) {
  return BlocProvider(
    create: (BuildContext context) => MeasurementCubit(
      const MeasurementState.initial(),
      context,
    )..read(),
    child: app,
  );
}
