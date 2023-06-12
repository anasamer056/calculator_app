import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:calculator_app/model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key, required this.resultModel});

  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            BlocProvider.of<CalculateCubit>(context).fetchMemory(resultModel);
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resultModel.expression,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize:
                          Theme.of(context).textTheme.titleMedium?.fontSize),
                ),
                Text(
                  '=${resultModel.result}',
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge?.fontSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
