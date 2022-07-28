import 'package:collector/ui/screens/home/components/atoms/date.container.dart';
import 'package:collector/ui/screens/home/components/atoms/number_picker.container.dart';
import 'package:collector/utils/extensions/localization.ext.dart';
import 'package:flutter/material.dart';

class MeasurementContainer extends StatefulWidget {
  const MeasurementContainer({super.key});

  @override
  State<MeasurementContainer> createState() => _MeasurementContainerState();
}

class _MeasurementContainerState extends State<MeasurementContainer> {
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
            title: context.locale.systolic,
            units: context.locale.measurementBloodPressure,
            currentValue: _currentSystolic,
            onValueChanged: (int newSystolic) => setState(
              () => _currentSystolic = newSystolic,
            ),
          ),
          const SizedBox(height: 12.0),
          NumberPickerContainer(
            title: context.locale.diastolic,
            units: context.locale.measurementBloodPressure,
            currentValue: _currentDiastolic,
            onValueChanged: (int newDiastolic) => setState(
              () => _currentDiastolic = newDiastolic,
            ),
          ),
          const SizedBox(height: 12.0),
          NumberPickerContainer(
            title: context.locale.pulse,
            units: context.locale.measurementPulse,
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
          MaterialButton(
            color: Theme.of(context).colorScheme.primary,
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {},
            child: Text(context.locale.add),
          ),
        ],
      ),
    );
  }
}
