import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/ui/screens/home/components/atoms/systolic_diastolic.widget.dart';
import 'package:collector/ui/screens/home/components/organisms/update.dialog.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:collector/utils/helpers/categorization.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MeasurementItem extends StatelessWidget {
  final Measurement data;

  const MeasurementItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Slidable(
      key: ValueKey(data.id),
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) =>
                BlocProvider.of<MeasurementCubit>(context)
                    .deleteMeasurement(data.id),
            foregroundColor: Colors.white,
            backgroundColor: theme.colorScheme.error,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
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
        onTap: () => showDialog<void>(
          context: context,
          builder: (BuildContext context) => Dialog(
            child: UpdateDialog(data: data),
          ),
        ),
      ),
    );
  }
}
