import 'package:flutter/material.dart';

class SystolicDiastolicWidget extends StatelessWidget {
  final int systolic;
  final int diastolic;

  const SystolicDiastolicWidget({
    super.key,
    required this.systolic,
    required this.diastolic,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CircleAvatar(
      backgroundColor: theme.colorScheme.primary,
      radius: 32.0,
      child: Text(
        '$systolic/$diastolic',
        style: theme.textTheme.bodyMedium
            ?.copyWith(color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
