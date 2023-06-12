import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'result_model.g.dart';

@HiveType(typeId: 0)
class ResultModel extends Equatable {
  @HiveField(0)
  final String expression;

  @HiveField(1)
  final String result;

  const ResultModel({this.expression = '', this.result = ''});

  factory ResultModel.copyWith(ResultModel resultModel) {
    return ResultModel(
      expression: resultModel.expression,
      result: resultModel.result,
    );
  }
  @override
  List<Object?> get props => [expression, result];
}
