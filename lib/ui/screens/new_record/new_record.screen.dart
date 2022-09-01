import 'package:collector/data/enums/emotion.enum.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/ui/screens/new_record/components/molecules/emotions.list.dart';
import 'package:collector/ui/screens/new_record/components/molecules/measurements.container.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewRecordScreen extends StatefulWidget {
  const NewRecordScreen({super.key});

  @override
  State<NewRecordScreen> createState() => _NewRecordScreenState();
}

class _NewRecordScreenState extends State<NewRecordScreen> {
  EmotionEnum? _emotion;

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.locale.commonNewRecord,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              context.locale.screenNewRecordChooseEmotion,
              textAlign: TextAlign.center,
              style: theme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            EmotionsList(
              onEmotionSelected: (EmotionEnum? emotion) => setState(
                () => _emotion = emotion,
              ),
            ),
            const SizedBox(height: 32.0),
            MeasurementsContainer(
              onMeasurementSelected: (
                int systolic,
                int diastolic,
                int pulse,
                DateTime date,
              ) =>
                  BlocProvider.of<MeasurementCubit>(context).addMeasurement(
                emotion: _emotion,
                systolic: systolic,
                diastolic: diastolic,
                pulse: pulse,
                date: date,
              ),
            )
          ],
        ),
      ),
    );
  }
}
