import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final ValueSetter<int> onPageSelected;

  const BottomBar({
    super.key,
    required this.onPageSelected,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.locale.bottomBarLabelHome,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.history),
          label: context.locale.bottomBarLabelHistory,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: context.locale.bottomBarLabelSettings,
        ),
      ],
      onTap: (int newIndex) {
        setState(() => _currentIndex = newIndex);
        widget.onPageSelected(_currentIndex);
      },
      currentIndex: _currentIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
    );
  }
}
