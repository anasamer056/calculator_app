import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension CalculateCubitExtension on BuildContext {
  CalculateCubit get calculateCubit => BlocProvider.of<CalculateCubit>(this);
}
