import 'dart:async';

import 'package:collector/config.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:collector/ui/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZoned(() async {
    // Disable HTTP fetching + add Inter to app's LicenseRegistry
    GoogleFonts.config.allowRuntimeFetching = false;
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('assets/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

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
