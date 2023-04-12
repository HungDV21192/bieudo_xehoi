import 'package:bieu_do_xe_hoi/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyles.tahoma600,
        headlineMedium: TextStyles.tahoma500,
        headlineSmall: TextStyles.tahoma400,
      ));
}
