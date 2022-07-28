import 'package:collector/config.dart';
import 'package:collector/data/measurement.schema.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IMeasurementRepository {
  Future<void> storeNewMeasurement(MeasurementSchema schema);
  Iterable<MeasurementSchema> getMeasurements();
}

class MeasurementRepository implements IMeasurementRepository {
  final Box<MeasurementSchema> _box;

  MeasurementRepository() : _box = getIt.get<Box<MeasurementSchema>>();

  @override
  Future<void> storeNewMeasurement(MeasurementSchema schema) async =>
      await _box.add(schema);

  @override
  Iterable<MeasurementSchema> getMeasurements() => _box.values;
}
