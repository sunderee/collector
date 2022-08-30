import 'package:flutter/material.dart';

class EmotionTile extends StatelessWidget {
  final String emoji;
  final String emotion;
  final bool isSelected;
  final VoidCallback onPressed;

  const EmotionTile({
    super.key,
    required this.emoji,
    required this.emotion,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 48.0,
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        color: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.primary.withOpacity(0.1),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  emoji,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(width: 4.0),
                Text(
                  emotion,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
