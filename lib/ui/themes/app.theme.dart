import 'package:collector/ui/themes/color.theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme(
    ColorScheme? scheme,
    BuildContext context,
    bool isLightTheme,
  ) {
    return ThemeData.from(
      useMaterial3: true,
      colorScheme: scheme ??
          ColorScheme.fromSeed(
            brightness: isLightTheme ? Brightness.light : Brightness.dark,
            seedColor: ColorTheme.colorProduct,
          ),
    );
  }

  const AppTheme._();
}
