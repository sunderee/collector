import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}

extension BuildContextExt on BuildContext {
  void showSnackBar(String text) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}
