import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:calculator_app/cubits/custom_bloc_observer.dart';
import 'package:calculator_app/cubits/memory_cubit/memory_cubit.dart';
import 'package:calculator_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:calculator_app/ui/global/theme/theme_data/theme_data_dark.dart';
import 'package:calculator_app/model/result_model.dart';
import 'package:calculator_app/ui/global/theme/theme_data/theme_data_light.dart';
import 'package:calculator_app/views/home_page/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:calculator_app/constants.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultModelAdapter());
  Box historyBox = await Hive.openBox(expHistory);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CalculateCubit(),
      ),
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => MemoryCubit(),
      ),
    ],
    child: CalculatorApp(),
  ));
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state is ThemeChanged ? state.theme : getThemeDataLight(),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
      },
    );
  }
}
