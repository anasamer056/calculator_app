import 'package:flutter/material.dart';

ThemeData getThemeDataDark() => ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Color.fromARGB(255, 53, 53, 53),
        onSecondary: Color.fromARGB(255, 173, 173, 173),
        tertiary: Colors.amber,
        onTertiary: Colors.amber,
        error: Color(0xFFF32424),
        onError: Color(0xFFF32424),
        background: Color(0xFF202020),
        onBackground: Color(0xFF505050),
        surface: Color(0xFF54B435),
        onSurface: Colors.white,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(size: 25)),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          )),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
