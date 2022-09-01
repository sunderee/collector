import 'package:collector/data/schemas/measurement.schema.dart';

extension MeasurementExt on Measurement {
  Map<String, dynamic> toJson() => {
        'id': id,
        'emotion': emotion?.emotionIndex,
        'systolic': systolic,
        'diastolic': diastolic,
        'pulse': pulse,
        'timestamp': timestamp.millisecondsSinceEpoch,
      };
}
