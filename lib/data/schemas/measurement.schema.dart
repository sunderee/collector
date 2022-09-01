import 'package:collector/data/converters.dart';
import 'package:collector/data/enums/emotion.enum.dart';
import 'package:isar/isar.dart';

part 'measurement.schema.g.dart';

@Collection()
class Measurement {
  @Id()
  int? id;

  @EmotionEnumConverter()
  EmotionEnum? emotion;

  late int systolic;
  late int diastolic;
  late int pulse;

  @DateTimeConverter()
  @Index(type: IndexType.value)
  late DateTime timestamp;
}
