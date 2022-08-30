import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:collector/ui/screens/home/components/atoms/systolic_diastolic.widget.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:collector/utils/helpers/categorization.helper.dart';
import 'package:flutter/material.dart';

class MeasurementItem extends StatelessWidget {
  final Measurement data;

  const MeasurementItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SystolicDiastolicWidget(
        systolic: data.systolic,
        diastolic: data.diastolic,
      ),
      title: Text(
        categorizeBloodPressure(data.systolic, data.diastolic)
                ?.toHumanReadable(context) ??
            context.locale.categoryUnknown,
      ),
      subtitle: Text(
        data.timestamp.formatToHumanReadable,
      ),
      trailing: data.emotion != null
          ? Text(data.emotion?.toEmotionEmoji ?? '')
          : null,
    );
  }
}
