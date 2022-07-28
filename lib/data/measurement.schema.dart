import 'package:hive_flutter/hive_flutter.dart';

part 'measurement.schema.g.dart';

@HiveType(typeId: 0)
class MeasurementSchema {
  @HiveField(0)
  final int systolic;

  @HiveField(1)
  final int diastolic;

  @HiveField(2)
  final int pulse;

  @HiveField(3)
  final int timestamp;

  const MeasurementSchema({
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.timestamp,
  });
}
