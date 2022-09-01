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
  Future<int> create(Measurement schema) async {
    return _isar.writeTxn((Isar database) {
      return database.measurements.put(
        schema,
        replaceOnConflict: true,
      );
    });
  }

  @override
  Future<List<Measurement>> read() async {
    return _isar.txn((Isar database) {
      return database.measurements.where().sortByTimestampDesc().findAll();
    });
  }

  @override
  Future<int> update(Measurement newMeasurement) async {
    return _isar.writeTxn((Isar database) async {
      return database.measurements.put(newMeasurement, replaceOnConflict: true);
    });
  }

  @override
  Future<bool> delete(int id) async {
    return _isar.writeTxn((Isar database) {
      return database.measurements.delete(id);
    });
  }
}
