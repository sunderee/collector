import 'package:collector/ui/widgets/number_picker.dart';
import 'package:flutter/material.dart';

class NumberPickerContainer extends StatelessWidget {
  final String title;
  final String units;
  final int currentValue;
  final ValueChanged<int> onValueChanged;

  const NumberPickerContainer({
    super.key,
    required this.title,
    required this.units,
    required this.currentValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          units,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        NumberPicker(
          minValue: 20,
          maxValue: 200,
          value: currentValue,
          onChanged: onValueChanged,
        ),
      ],
    );
  }
}
