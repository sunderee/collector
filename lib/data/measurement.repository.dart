import 'package:collector/config.dart';
import 'package:collector/data/measurement.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IMeasurementRepository {
  Future<void> storeNewMeasurement(MeasurementModel schema);
  Iterable<MeasurementModel> getMeasurements();
}

class MeasurementRepository implements IMeasurementRepository {
  final Box<MeasurementModel> _box;

  MeasurementRepository() : _box = getIt.get<Box<MeasurementModel>>();

  @override
  Future<void> storeNewMeasurement(MeasurementModel schema) async =>
      await _box.add(schema);

  @override
  Iterable<MeasurementModel> getMeasurements() => _box.values;
}
