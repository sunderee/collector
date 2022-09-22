import 'package:collector/config.dart';
import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:isar/isar.dart';

abstract class IMeasurementRepository {
  Future<int> create(Measurement schema);
  Future<List<Measurement>> read();
  Future<int> update(Measurement newMeasurement);
  Future<bool> delete(int id);
}

class MeasurementRepository implements IMeasurementRepository {
  final Isar _isar;

  MeasurementRepository() : _isar = getIt.get<Isar>();

  @override
  Future<int> create(Measurement schema) async =>
      _isar.writeTxn(() => _isar.measurements.put(schema));

  @override
  Future<List<Measurement>> read() async => _isar
      .txn(() => _isar.measurements.where().sortByTimestampDesc().findAll());

  @override
  Future<int> update(Measurement newMeasurement) async =>
      _isar.writeTxn(() async => _isar.measurements.put(newMeasurement));

  @override
  Future<bool> delete(int id) async =>
      _isar.writeTxn(() => _isar.measurements.delete(id));
}
