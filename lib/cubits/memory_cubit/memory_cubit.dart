import 'package:bloc/bloc.dart';
import 'package:calculator_app/constants.dart';
import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:calculator_app/model/result_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'memory_state.dart';

class MemoryCubit extends Cubit<MemoryState> {
  MemoryCubit() : super(MemoryInitial());

  void saveResult(ResultModel resultModel) async {
    if (resultModel.result.isNotEmpty) {
      await Hive.box(expHistory).add(resultModel);

      emit(MemoryAdded());
    }
  }

  void clearMemory() async {
    await Hive.box(expHistory).clear();
    emit(MemoryDeleted());
  }
}
