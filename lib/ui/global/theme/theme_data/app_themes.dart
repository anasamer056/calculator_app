import 'package:calculator_app/UI/global/theme/theme_data/theme_data_dark.dart';
import 'package:calculator_app/ui/global/theme/theme_data/theme_data_light.dart';

/// An enum is the best option here because using string values
/// with the map below will mean you'll have to remember all theme
/// names.
enum AppTheme {
  dark,
  light,
}

/// In the original video he placed the AppData instances directly
/// in the map as values. I thought I should keep using these functions
/// to keep it short and clean.
final Map appThemeData = {
  AppTheme.dark: getThemeDataDark(),
  AppTheme.light: getThemeDataLight(),
};
