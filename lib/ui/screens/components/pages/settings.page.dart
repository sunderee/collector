import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text(context.locale.exportTitle),
          subtitle: Text(
            context.locale.exportSubtitle,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        const Divider(),
        ListTile(
          title: Text(context.locale.sourceCodeTitle),
          subtitle: Text(
            context.locale.sourceCodeSubtitle,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
