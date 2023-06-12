part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final bool isDark;

  const ThemeState({required this.isDark});
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({super.isDark = false});
}

class ThemeChanged extends ThemeState {
  final ThemeData theme;

  const ThemeChanged({required bool isDark, required this.theme})
      : super(isDark: isDark);
}
