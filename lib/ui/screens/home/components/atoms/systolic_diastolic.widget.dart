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
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.02),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            systolic.toString(),
            style: theme.textTheme.bodyLarge,
          ),
          const Divider(),
          Text(
            diastolic.toString(),
            style: theme.textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
