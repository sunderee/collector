import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

enum EmotionEnum {
  happiness(0),
  sadness(1),
  stressOrAnxiety(2),
  anticipation(3),
  loveOrJoy(4),
  anger(5);

  static EmotionEnum? fromIndex(int emotionIndex) {
    switch (emotionIndex) {
      case 0:
        return EmotionEnum.happiness;
      case 1:
        return EmotionEnum.sadness;
      case 2:
        return EmotionEnum.stressOrAnxiety;
      case 3:
        return EmotionEnum.anticipation;
      case 4:
        return EmotionEnum.loveOrJoy;
      case 5:
        return EmotionEnum.anger;
      default:
        return null;
    }
  }

  final int emotionIndex;
  const EmotionEnum(this.emotionIndex);

  String? get toEmotionEmoji {
    switch (this) {
      case EmotionEnum.happiness:
        return '😊';
      case EmotionEnum.sadness:
        return '😢';
      case EmotionEnum.stressOrAnxiety:
        return '😫';
      case EmotionEnum.anticipation:
        return '🥺';
      case EmotionEnum.loveOrJoy:
        return '🥰';
      case EmotionEnum.anger:
        return '🤬';
      default:
        return null;
    }
  }

  String? toEmotionText(BuildContext context) {
    switch (this) {
      case EmotionEnum.happiness:
        return context.locale.feelingHappiness;
      case EmotionEnum.sadness:
        return context.locale.feelingSadness;
      case EmotionEnum.stressOrAnxiety:
        return context.locale.feelingStressOrAnxiety;
      case EmotionEnum.anticipation:
        return context.locale.feelingAnticipation;
      case EmotionEnum.loveOrJoy:
        return context.locale.feelingLoveOrJoy;
      case EmotionEnum.anger:
        return context.locale.feelingAnger;
      default:
        return null;
    }
  }
}
