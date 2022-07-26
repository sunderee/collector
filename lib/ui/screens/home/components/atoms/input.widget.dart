import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputAction action;

  const InputWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          title,
          style: theme.textTheme.labelMedium
              ?.copyWith(color: theme.colorScheme.onSurface),
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textInputAction: action,
          inputFormatters: [LengthLimitingTextInputFormatter(3)],
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintText: context.locale.commonInputHint,
          ),
        ),
      ],
    );
  }
}
