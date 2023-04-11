import 'package:calculator_app/ui/global/theme/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/ui/global/theme/app_colors/app_colors_dark.dart';
import 'package:flutter/services.dart';

ThemeData getThemeDataLight() => ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF202020),
        onPrimary: Color(0xFF505050),
        secondary: Color.fromARGB(255, 228, 228, 228),
        onSecondary: Color.fromARGB(255, 90, 90, 90),
        tertiary: Colors.blue,
        onTertiary: Colors.blue,
        error: Color(0xFFF32424),
        onError: Color(0xFFF32424),
        background: Color(0xFFF1F2F3),
        onBackground: Color(0xFFFFFFFF),
        surface: Colors.black,
        onSurface: Colors.black,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          actionsIconTheme: IconThemeData(size: 25)),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(TextStyle(
              fontWeight: FontWeight.w500, fontSize: 25, color: Colors.black)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
