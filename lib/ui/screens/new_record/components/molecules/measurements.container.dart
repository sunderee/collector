import 'package:collector/ui/screens/new_record/components/molecules/date.container.dart';
import 'package:collector/ui/screens/new_record/components/molecules/number_picker.container.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef OnMeasurementSelectedCallback = void Function(
  int systolic,
  int diastolic,
  int pulse,
  DateTime date,
);

class MeasurementsContainer extends StatefulWidget {
  final OnMeasurementSelectedCallback onMeasurementSelected;

  const MeasurementsContainer({super.key, required this.onMeasurementSelected});

  @override
  State<MeasurementsContainer> createState() => _MeasurementsContainerState();
}

class _MeasurementsContainerState extends State<MeasurementsContainer> {
  int _currentSystolic = 120;
  int _currentDiastolic = 70;
  int _currentPulse = 80;
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NumberPickerContainer(
            title: context.locale.screenNewRecordSystolic,
            units: context.locale.screenNewRecordMeasurementBloodPressure,
            currentValue: _currentSystolic,
            onValueChanged: (int newSystolic) => setState(
              () => _currentSystolic = newSystolic,
            ),
          ),
          const SizedBox(height: 12.0),
          NumberPickerContainer(
            title: context.locale.screenNewRecordDiastolic,
            units: context.locale.screenNewRecordMeasurementBloodPressure,
            currentValue: _currentDiastolic,
            onValueChanged: (int newDiastolic) => setState(
              () => _currentDiastolic = newDiastolic,
            ),
          ),
          const SizedBox(height: 12.0),
          NumberPickerContainer(
            title: context.locale.screenNewRecordPulse,
            units: context.locale.screenNewRecordMeasurementPulse,
            currentValue: _currentPulse,
            onValueChanged: (int newPulse) => setState(
              () => _currentPulse = newPulse,
            ),
          ),
          const SizedBox(height: 24.0),
          DateContainer(
            date: _currentDate,
            onDateChanged: (DateTime newDate) => setState(
              () => _currentDate = newDate,
            ),
          ),
          const SizedBox(height: 32.0),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                widget.onMeasurementSelected(
                  _currentSystolic,
                  _currentDiastolic,
                  _currentPulse,
                  _currentDate,
                );
                _showMeasurementDialog();
              },
              child: Text(context.locale.screenNewRecordAdd),
            ),
          ),
        ],
      ),
    );
  }

  void _showMeasurementDialog() => showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          final theme = Theme.of(context);

          return AlertDialog(
            backgroundColor: theme.colorScheme.surface,
            title: Text(
              context.locale.screenNewRecordRecordAddedTitle,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(color: theme.colorScheme.onSurface),
            ),
            content: Text(
              context.locale.screenNewRecordRecordAddedSubtitle,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text(
                  context.locale.commonOK,
                  style: theme.textTheme.labelLarge
                      ?.copyWith(color: theme.colorScheme.primary),
                ),
              ),
            ],
          );
        },
      );
}
