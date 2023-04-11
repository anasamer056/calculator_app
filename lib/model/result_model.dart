import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'result_model.g.dart';

@HiveType(typeId: 0)
class ResultModel extends Equatable {
  @HiveField(0)
  String expression;

  @HiveField(1)
  String result;

  ResultModel({this.expression = '', this.result = ''});

  @override
  List<Object?> get props => [expression, result];
}
