import 'package:hive_flutter/hive_flutter.dart';

part 'measurement.model.g.dart';

@HiveType(typeId: 0)
class MeasurementModel {
  @HiveField(0)
  final int systolic;

  @HiveField(1)
  final int diastolic;

  @HiveField(2)
  final int pulse;

  @HiveField(3)
  final int timestamp;

  const MeasurementModel({
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.timestamp,
  });

  factory MeasurementModel.fromJson(Map<String, int> json) => MeasurementModel(
        systolic: json['systolic'] as int,
        diastolic: json['diastolic'] as int,
        pulse: json['pulse'] as int,
        timestamp: json['timestamp'] as int,
      );

  Map<String, int> toJson() => {
        'systolic': systolic,
        'diastolic': diastolic,
        'pulse': pulse,
        'timestamp': timestamp,
      };
}
