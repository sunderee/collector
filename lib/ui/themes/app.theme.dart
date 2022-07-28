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
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.copyWith(
                headline5: Theme.of(context).textTheme.headline5?.copyWith(
                      color: ColorTheme.colorBackgroundDark,
                    ),
                headline6: Theme.of(context).textTheme.headline6?.copyWith(
                      color: ColorTheme.colorBackgroundDark,
                    ),
                subtitle1: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: ColorTheme.colorBackgroundDark,
                    ),
                bodyText1: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: ColorTheme.colorBackgroundDark,
                    ),
                bodyText2: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: ColorTheme.colorBackgroundDark,
                    ),
                overline: Theme.of(context).textTheme.overline?.copyWith(
                      color: ColorTheme.colorBackgroundDark,
                    ),
              ),
        ),
        useMaterial3: true,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: ColorTheme.colorBackgroundLight,
        ),
        iconTheme: const IconThemeData(color: ColorTheme.colorTextDark),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      );

  static ThemeData darkAppTheme(BuildContext context) => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: ColorTheme.colorProduct,
          background: ColorTheme.colorBackgroundDark,
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.copyWith(
                headline5: Theme.of(context).textTheme.headline5?.copyWith(
                      color: ColorTheme.colorBackgroundLight,
                    ),
                headline6: Theme.of(context).textTheme.headline6?.copyWith(
                      color: ColorTheme.colorBackgroundLight,
                    ),
                subtitle1: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: ColorTheme.colorBackgroundLight,
                    ),
                bodyText1: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: ColorTheme.colorBackgroundLight,
                    ),
                bodyText2: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: ColorTheme.colorBackgroundLight,
                    ),
                overline: Theme.of(context).textTheme.overline?.copyWith(
                      color: ColorTheme.colorBackgroundLight,
                    ),
              ),
        ),
        useMaterial3: true,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: ColorTheme.colorBackgroundDark,
        ),
        iconTheme: const IconThemeData(color: ColorTheme.colorTextLight),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      );

  const AppTheme._();
}
