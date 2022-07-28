import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  static final _formatter = DateFormat.yMMMMd().add_Hm();

  String get formatToHumanReadable => _formatter.format(this);
}
