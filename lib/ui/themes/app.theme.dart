import 'package:collector/ui/themes/color.theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkAppTheme(BuildContext context) => ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
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
          centerTitle: true,
          color: ColorTheme.colorBackgroundDark,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      );

  const AppTheme._();
}
