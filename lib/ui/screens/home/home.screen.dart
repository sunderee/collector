import 'package:collector/ui/router.dart';
import 'package:collector/ui/screens/home/components/molecules/measurements.list.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/helpers/export.helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.locale.appName,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () => launchUrlString(
              'https://github.com/sunderee/collector',
              mode: LaunchMode.externalApplication,
            ),
          ),
          IconButton(
            onPressed: () => _openExportDialog(context),
            icon: const Icon(Icons.file_download),
          ),
        ],
      ),
      body: const MeasurementsList(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => context.push(AppRoute.newRecord.routePath),
        label: Text(
          context.locale.commonNewRecord,
          style: const TextStyle(color: Colors.black87),
        ),
        icon: const Icon(Icons.add, color: Colors.black87),
      ),
    );
  }

  void _openExportDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(context.locale.screenHomeExportTitle),
        content: Text(context.locale.screenHomeExportContents),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.locale.commonCancel),
          ),
          TextButton(
            onPressed: () => exportAndShare(),
            child: Text(context.locale.commonOK),
          ),
        ],
      ),
    );
  }
}
