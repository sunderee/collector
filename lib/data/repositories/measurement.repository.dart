import 'package:collector/config.dart';
import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:isar/isar.dart';

abstract class IMeasurementRepository {
  Future<int> storeMeasurement(Measurement schema);
  Future<List<Measurement>> getAll();
}

class MeasurementRepository implements IMeasurementRepository {
  final Isar _isar;

  MeasurementRepository() : _isar = getIt.get<Isar>();

  @override
  Future<int> storeMeasurement(Measurement schema) async {
    return _isar.writeTxn((Isar database) {
      return database.measurements.put(
        schema,
        replaceOnConflict: true,
      );
    });
  }

  @override
  Future<List<Measurement>> getAll() async {
    return _isar.txn((Isar database) {
      return database.measurements.where().sortByTimestampDesc().findAll();
    });
  }
}
