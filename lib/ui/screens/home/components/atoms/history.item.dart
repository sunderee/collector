import 'package:collector/data/measurement.schema.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:collector/utils/helpers/blood_pressure_categorization.helper.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final MeasurementSchema item;

  const HistoryItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        categorizeBloodPressure(item.systolic, item.diastolic)
                ?.toHumanReadable(context) ??
            context.locale.categoryUnknown,
      ),
      subtitle: Text(
        '${DateTime.fromMillisecondsSinceEpoch(item.timestamp).formatToHumanReadable} | ${item.pulse} ${context.locale.measurementPulse}',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
