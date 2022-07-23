import 'package:collector/ui/screens/home/components/measurement.container.dart';
import 'package:collector/utils/extensions/localization.ext.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: systolic, diastolic and pulse number pickers
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.appName),
      ),
      body: const SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: MeasurementContainer(),
      ),
    );
  }
}
