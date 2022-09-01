import 'package:collector/ui/screens/home/components/atoms/input.widget.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class DetailInputs extends StatelessWidget {
  final TextEditingController systolicController;
  final TextEditingController diastolicController;
  final TextEditingController pulseController;

  const DetailInputs({
    super.key,
    required this.systolicController,
    required this.diastolicController,
    required this.pulseController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: InputWidget(
            controller: systolicController,
            title: context.locale.screenNewRecordSystolic,
            action: TextInputAction.next,
          ),
        ),
        Expanded(
          child: InputWidget(
            controller: diastolicController,
            title: context.locale.screenNewRecordDiastolic,
            action: TextInputAction.next,
          ),
        ),
        Expanded(
          child: InputWidget(
            controller: pulseController,
            title: context.locale.screenNewRecordPulse,
            action: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
