import 'package:hive_flutter/hive_flutter.dart';

part 'measurement.model.g.dart';

@HiveType(typeId: 0)
class MeasurementModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int systolic;

  @HiveField(2)
  final int diastolic;

  @HiveField(3)
  final int pulse;

  @HiveField(4)
  final int timestamp;

  const MeasurementModel({
    required this.id,
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.timestamp,
  });

  factory MeasurementModel.fromJson(Map<String, dynamic> json) =>
      MeasurementModel(
        id: json['id'] as String,
        systolic: json['systolic'] as int,
        diastolic: json['diastolic'] as int,
        pulse: json['pulse'] as int,
        timestamp: json['timestamp'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'systolic': systolic,
        'diastolic': diastolic,
        'pulse': pulse,
        'timestamp': timestamp,
      };
}
