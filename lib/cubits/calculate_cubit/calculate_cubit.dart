import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_parser/math_parser.dart';

import '../../model/result_model.dart';

part 'calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(const CalculateInitial(ResultModel()));

  final ScrollController expressionController = ScrollController();

  void addNumber(
    ResultModel resultModel, {
    required String input,
  }) {
    late String newExp;
    late String newRes;

    try {
      newExp = resultModel.expression + input;
      newRes = evaluateExp(newExp);

      scrollExp(resultModel);
      emit(CalculateSuccess(ResultModel(expression: newExp, result: newRes)));
    } catch (e) {
      emit(CalculateFailed(resultModel, e.toString()));
    }
  }

  void addOperator(ResultModel resultModel, {required String input}) {
    if (hasOperator(resultModel.expression) &&
        resultModel.expression.endsWith(' ')) {
      try {
        late String newExp;
        late String newRes;

        newExp = resultModel.expression
                .substring(0, resultModel.expression.length - 3) +
            input;
        newRes = evaluateExp(newExp);

        scrollExp(resultModel);
        emit(CalculateSuccess(ResultModel(expression: newExp, result: newRes)));
      } catch (e) {
        emit(CalculateFailed.copyWith(resultModel, errMsg: e.toString()));
      }
    } else {
      try {
        late String newExp;
        late String newRes;

        newExp = resultModel.expression + input;
        newRes = evaluateExp(newExp);

        scrollExp(resultModel);
        emit(CalculateSuccess(ResultModel(expression: newExp, result: newRes)));
      } catch (e) {
        emit(CalculateFailed.copyWith(resultModel, errMsg: e.toString()));
      }
    }
  }

  void clearAll(ResultModel resultModel) {
    emit(const CalculateSuccess(ResultModel()));
  }

  void clearLast(ResultModel resultModel) {
    if (resultModel.expression.isNotEmpty) {
      if (resultModel.expression[resultModel.expression.length - 1] == ' ') {
        late String newExp;
        late String newRes;

        newExp = resultModel.expression
            .substring(0, resultModel.expression.length - 3);
        newRes = evaluateExp(newExp);

        emit(CalculateSuccess(ResultModel(expression: newExp, result: newRes)));
      } else {
        late String newExp;
        late String newRes;

        newExp = resultModel.expression
            .substring(0, resultModel.expression.length - 1);
        newRes = evaluateExp(newExp);

        emit(CalculateSuccess(ResultModel(expression: newExp, result: newRes)));
      }
    }
  }

  String evaluateExp(String expression) {
    if (expression.isNotEmpty) {
      if (hasOperator(expression) && expression[expression.length - 1] != ' ') {
        late String newRes;

        final output = MathNodeExpression.fromString(expression)
            .calc(MathVariableValues.none);

        newRes = output
            .toStringAsFixed(2)
            .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");

        return newRes;
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  void equalButton(ResultModel resultModel) {
    late String newExp;
    if (resultModel.result.isNotEmpty) {
      newExp = resultModel.result;

      emit(CalculateSuccess(ResultModel(expression: newExp)));
    }
  }

  void decPointButton(ResultModel resultModel) {
    if (!resultModel.expression.endsWith('.')) {
      addNumber(resultModel, input: '.');
    }
  }

  void fetchMemory(ResultModel resultModel) {
    emit(CalculateSuccess(ResultModel.copyWith(resultModel)));
  }

  bool hasOperator(String expression) {
    if (expression.contains(' + ') ||
        expression.contains(' - ') ||
        expression.contains(' / ') ||
        expression.contains(' * ')) {
      return true;
    } else {
      return false;
    }
  }

  void scrollExp(ResultModel resultModel) {
    if (resultModel.expression.length > 29) {
      expressionController.jumpTo(
        expressionController.position.maxScrollExtent + 12,
      );
    }
  }
}
