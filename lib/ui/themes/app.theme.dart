import 'package:collector/ui/themes/color.theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appTheme(ColorScheme? scheme, BuildContext context) =>
      ThemeData.from(
        useMaterial3: true,
        colorScheme: scheme ??
            ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: ColorTheme.colorProduct,
              background: ColorTheme.colorBackgroundDark,
            ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
          centerTitle: true,
        ),
      );

  const AppTheme._();
}
