import 'package:bloc/bloc.dart';
import 'package:calculator_app/UI/global/theme/theme_data/theme_data_dark.dart';
import 'package:calculator_app/ui/global/theme/theme_data/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme(bool isDark) {
    isDark
        ? emit(ThemeChanged(theme: getThemeDataDark(), isDark: true))
        : emit(ThemeChanged(theme: getThemeDataLight(), isDark: false));
  }
}
