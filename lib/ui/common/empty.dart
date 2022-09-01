import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.folder_open,
            size: 48.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            context.locale.commonNothingToSeeHere,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
