import 'package:collector/ui/screens/new_record/components/molecules/emotions.list.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class NewRecordScreen extends StatelessWidget {
  const NewRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.locale.commonNewRecord,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              context.locale.screenNewRecordChooseEmotion,
              style: theme.titleMedium,
            ),
            const EmotionsList(),
          ],
        ),
      ),
    );
  }
}
