import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:collector/utils/helpers/blood_pressure_categorization.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeasurementCubit, MeasurementState>(
      listener: (BuildContext context, MeasurementState state) {},
      builder: (BuildContext context, MeasurementState state) {
        if (state.status == StatusEnum.successful) {
          final items = state.data;
          return items.isNotEmpty
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    final item = items[index];
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
                  },
                )
              : Center(
                  child: Text(
                    context.locale.empty,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      },
    );
  }
}
