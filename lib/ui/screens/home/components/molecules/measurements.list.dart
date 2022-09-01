import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:collector/state/status.dart';
import 'package:collector/ui/common/empty.dart';
import 'package:collector/ui/common/loading.dart';
import 'package:collector/ui/screens/home/components/atoms/measurement.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasurementsList extends StatelessWidget {
  const MeasurementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeasurementCubit, MeasurementState>(
      listener: (BuildContext context, MeasurementState state) {},
      builder: (BuildContext context, MeasurementState state) {
        if (state.status == StatusEnum.successful) {
          if (state.data.isEmpty) {
            return const Empty();
          } else {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) => MeasurementItem(
                data: state.data[index],
              ),
            );
          }
        } else {
          return const Loading();
        }
      },
    );
  }
}
