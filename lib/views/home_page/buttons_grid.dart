import '../../cubits/calculate_cubit/calculate_cubit.dart';
import '../../cubits/memory_cubit/memory_cubit.dart';
import '../../data/buttons_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/calculate_cubit/calculate_cubit_extension.dart';

class ButtonsGrid extends StatelessWidget {
  const ButtonsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculateCubit = context.calculateCubit;
    return BlocBuilder<CalculateCubit, CalculateState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 95,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buttons.length,
          itemBuilder: (BuildContext context, int index) {
            if (buttons[index] == 'AC' ||
                buttons[index] == '⌫' ||
                buttons[index] == '.' ||
                buttons[index] == ' / ' ||
                buttons[index] == ' * ' ||
                buttons[index] == ' - ' ||
                buttons[index] == ' + ' ||
                buttons[index] == '=') {
              return TextButton(
                onPressed: () {
                  if (buttons[index] == 'AC') {
                    calculateCubit.clearAll(state.resultModel);
                  } else if (buttons[index] == '⌫') {
                    calculateCubit.clearLast(state.resultModel);
                  } else if (buttons[index] == '.') {
                    calculateCubit.decPointButton(
                      state.resultModel,
                    );
                  } else if (buttons[index] == '=') {
                    calculateCubit.equalButton(state.resultModel);
                    BlocProvider.of<MemoryCubit>(context)
                        .saveResult(state.resultModel);
                  } else {
                    calculateCubit.addOperator(state.resultModel,
                        input: buttons[index]);
                  }
                },
                child: Text(
                  buttons[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              );
            } else {
              return TextButton(
                onPressed: () {
                  calculateCubit.addNumber(state.resultModel,
                      input: buttons[index]);
                },
                child: Text(
                  buttons[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
