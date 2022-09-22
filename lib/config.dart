import 'package:collector/data/repositories/measurement.repository.dart';
import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // final directory = await getApplicationDocumentsDirectory();
  final isarInstance = await Isar.open(
    [MeasurementSchema],
    // directory: directory.path,
  );
  getIt.registerSingleton<Isar>(isarInstance);
  getIt.registerSingleton<IMeasurementRepository>(MeasurementRepository());
}
