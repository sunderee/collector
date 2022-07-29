import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:collector/ui/screens/home/components/atoms/history.item.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
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
                  ) =>
                      HistoryItem(item: items[index]),
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
