import 'package:collector/data/enums/emotion.enum.dart';
import 'package:isar/isar.dart';

class EmotionEnumConverter extends TypeConverter<EmotionEnum?, int?> {
  const EmotionEnumConverter();

  @override
  EmotionEnum? fromIsar(int? object) =>
      object?.let((int it) => EmotionEnum.fromIndex(it));

  @override
  int? toIsar(EmotionEnum? object) => object?.emotionIndex;
}

class DateTimeConverter extends TypeConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromIsar(int object) => DateTime.fromMillisecondsSinceEpoch(object);

  @override
  int toIsar(DateTime object) => object.millisecondsSinceEpoch;
}

extension ScopeFunctionLet<T extends Object> on T {
  R let<R>(R Function(T self) block) => block(this);
}
