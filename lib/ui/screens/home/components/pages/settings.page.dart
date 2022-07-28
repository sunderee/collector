import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.locale.empty,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
