import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculate_cubit.dart';

extension CalculateCubitExtension on BuildContext {
  CalculateCubit get calculateCubit => BlocProvider.of<CalculateCubit>(this);
}
