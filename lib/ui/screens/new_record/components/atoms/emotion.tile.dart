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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ActionChip(
        side: BorderSide(
          color: isSelected
              ? theme.colorScheme.secondaryContainer
              : theme.colorScheme.outline,
        ),
        backgroundColor: isSelected
            ? theme.colorScheme.secondaryContainer
            : theme.colorScheme.surface,
        avatar: Text(
          emoji,
          style: theme.textTheme.labelLarge,
        ),
        label: Text(
          emotion,
          style: theme.textTheme.labelLarge?.copyWith(
            color: isSelected
                ? theme.colorScheme.onSecondaryContainer
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
