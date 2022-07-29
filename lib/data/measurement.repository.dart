import 'package:collector/config.dart';
import 'package:collector/data/measurement.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IMeasurementRepository {
  Future<void> write(MeasurementModel schema);
  Iterable<MeasurementModel> read();
  Future<void> delete(String id);
}

class MeasurementRepository implements IMeasurementRepository {
  final Box<MeasurementModel> _box;

  MeasurementRepository() : _box = getIt.get<Box<MeasurementModel>>();

  @override
  Future<void> write(MeasurementModel schema) async =>
      await _box.put(schema.id, schema);

  @override
  Iterable<MeasurementModel> read() => _box.values;

  @override
  Future<void> delete(String id) async => await _box.delete(id);
}
