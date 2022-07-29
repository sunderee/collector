import 'package:collector/config.dart';
import 'package:collector/data/measurement.repository.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/helpers/json.helper.dart';
import 'package:collector/utils/helpers/url_launcher.helper.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
          onTap: () async {
            final file = await jsonFileExporter(
              getIt.get<IMeasurementRepository>().getMeasurements().toList(),
            );
            Share.shareFiles([file.path]);
          },
        ),
        const Divider(),
        ListTile(
          title: Text(context.locale.sourceCodeTitle),
          subtitle: Text(
            context.locale.sourceCodeSubtitle,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onTap: () => launchRepositoryURL(),
        ),
      ],
    );
  }
}
