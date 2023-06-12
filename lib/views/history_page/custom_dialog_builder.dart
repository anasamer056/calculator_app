import 'package:calculator_app/cubits/memory_cubit/memory_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> customDialogBuilder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('You sure?'),
      actions: [
        TextButton(
            onPressed: () {
              BlocProvider.of<MemoryCubit>(context).clearMemory();
              Navigator.pop(context);
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'))
      ],
    ),
  );
}
