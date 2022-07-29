import 'package:collector/data/measurement.model.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasurementDialog extends StatelessWidget {
  final MeasurementModel model;

  const MeasurementDialog({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateTime.fromMillisecondsSinceEpoch(model.timestamp)
                .formatToHumanReadable,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.overline,
          ),
          const SizedBox(height: 16.0),
          Text(
            '${model.systolic}/${model.diastolic}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            context.locale.measurementBloodPressure,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const Divider(),
          Text(
            model.pulse.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            context.locale.measurementPulse,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            BlocProvider.of<MeasurementCubit>(context).delete(model.id);
            Navigator.pop(context);
          },
          child: Text(context.locale.delete),
        ),
      ],
    );
  }
}
