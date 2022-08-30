import 'package:collector/ui/router.dart';
import 'package:collector/ui/screens/home/components/molecules/measurements.list.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.locale.appName,
        ),
      ),
      body: const MeasurementsList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoute.newRecord.routePath),
        label: Text(context.locale.commonNewRecord),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
