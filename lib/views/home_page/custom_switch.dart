import 'package:calculator_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDark,
          onChanged: (value) {
            BlocProvider.of<ThemeCubit>(context).changeTheme(value);
          },
        );
      },
    );
  }
}
