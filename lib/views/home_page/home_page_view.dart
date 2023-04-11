import 'dart:math';

import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:calculator_app/ui/global/theme/app_colors/app_colors_dark.dart';
import 'package:calculator_app/views/history_page/history_page.dart';
import 'package:calculator_app/views/home_page/buttons_grid.dart';
import 'package:calculator_app/views/home_page/custom_switch.dart';
import 'package:calculator_app/views/home_page/result_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_parser/math_parser.dart';
import 'package:math_parser/integrate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculateCubit, CalculateState>(
      listener: (context, state) {
        if (state is CalculateFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Invalid input. Try again?',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(),
                    ));
              },
              icon: const Icon(Icons.history),
            ),
            IconButton(onPressed: () {}, icon: CustomSwitch())
          ],
        ),
        body: Column(
          children: [
            ResultBox(),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.secondary,
                child: ButtonsGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
