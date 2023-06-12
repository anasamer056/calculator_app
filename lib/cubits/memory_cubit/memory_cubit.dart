import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../model/result_model.dart';

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
