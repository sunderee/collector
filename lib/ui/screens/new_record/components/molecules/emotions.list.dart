import 'package:collector/data/enums/emotion.enum.dart';
import 'package:collector/ui/screens/new_record/components/atoms/emotion.tile.dart';
import 'package:flutter/material.dart';

class EmotionsList extends StatefulWidget {
  final ValueSetter<EmotionEnum?> onEmotionSelected;

  const EmotionsList({
    super.key,
    required this.onEmotionSelected,
  });

  @override
  State<EmotionsList> createState() => _EmotionsListState();
}

class _EmotionsListState extends State<EmotionsList> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    const List<EmotionEnum> emotions = EmotionEnum.values;
    return SizedBox(
      height: 48.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: emotions.length,
        itemBuilder: (BuildContext context, int index) => EmotionTile(
          emoji: emotions[index].toEmotionEmoji ?? '',
          emotion: emotions[index].toEmotionText(context) ?? '',
          isSelected: _selectedIndex == index,
          onPressed: () {
            if (_selectedIndex == index) {
              setState(() => _selectedIndex = null);
              widget.onEmotionSelected(null);
            } else {
              setState(() => _selectedIndex = index);
              widget.onEmotionSelected(emotions[index]);
            }
          },
        ),
      ),
    );
  }
}
