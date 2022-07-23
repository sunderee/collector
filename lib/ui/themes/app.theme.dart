import 'package:collector/ui/themes/color.theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightAppTheme(BuildContext context) => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: ColorTheme.colorProduct,
          background: ColorTheme.colorBackgroundLight,
        ),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: ColorTheme.colorBackgroundLight,
        ),
      );

  static ThemeData darkAppTheme(BuildContext context) => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: ColorTheme.colorProduct,
          background: ColorTheme.colorBackgroundDark,
        ),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: ColorTheme.colorBackgroundDark,
        ),
      );

  const AppTheme._();
}
