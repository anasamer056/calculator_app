import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:calculator_app/views/history_page/history_page.dart';
import 'package:calculator_app/views/home_page/buttons_grid.dart';
import 'package:calculator_app/views/home_page/custom_switch.dart';
import 'package:calculator_app/views/home_page/result_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      builder: (context) => const HistoryPage(),
                    ));
              },
              icon: const Icon(Icons.history),
            ),
            IconButton(onPressed: () {}, icon: const CustomSwitch())
          ],
        ),
        body: Column(
          children: [
            const ResultBox(),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.secondary,
                child: const ButtonsGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
