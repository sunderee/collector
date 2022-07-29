import 'package:collector/data/measurement.model.dart';
import 'package:collector/ui/screens/components/organisms/measurement.dialog.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:collector/utils/helpers/blood_pressure_categorization.helper.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final MeasurementModel model;

  const HistoryItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        categorizeBloodPressure(model.systolic, model.diastolic)
                ?.toHumanReadable(context) ??
            context.locale.categoryUnknown,
      ),
      subtitle: Text(
        '${DateTime.fromMillisecondsSinceEpoch(model.timestamp).formatToHumanReadable} | ${model.pulse} ${context.locale.measurementPulse}',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => MeasurementDialog(model: model),
      ),
    );
  }
}
