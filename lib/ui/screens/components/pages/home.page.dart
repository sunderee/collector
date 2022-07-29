import 'package:collector/ui/screens/components/molecules/measurement.container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.all(16.0),
      child: MeasurementContainer(),
    );
  }
}
