import 'package:collector/ui/themes/color.theme.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
        backgroundColor: ColorTheme.colorBackgroundDark,
      ),
    );
  }
}
