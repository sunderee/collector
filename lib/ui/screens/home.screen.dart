import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
