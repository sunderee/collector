import 'package:collector/data/enums/emotion.enum.dart';
import 'package:isar/isar.dart';

part 'measurement.schema.g.dart';

@Collection()
class Measurement {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  EmotionEnum? emotion;

  late int systolic;
  late int diastolic;
  late int pulse;

  @Index(type: IndexType.value)
  late DateTime timestamp;
}
