import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class NewRecordScreen extends StatelessWidget {
  const NewRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.locale.commonNewRecord,
        ),
      ),
    );
  }
}
