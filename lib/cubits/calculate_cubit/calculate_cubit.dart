import 'package:calculator_app/model/result_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_parser/math_parser.dart';
part 'calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(CalculateInitial(ResultModel()));

  final ScrollController expressionController = ScrollController();

  void addNumber(
    ResultModel resultModel, {
    required String input,
  }) {
    resultModel.expression = resultModel.expression + input;
    scrollExp(resultModel);

    try {
      resultModel.result = evaluateExp(resultModel);
    } catch (e) {
      emit(CalculateFailed.override(resultModel, errMsg: e.toString()));
    }

    emit(CalculateSuccess(resultModel));
  }

  void scrollExp(ResultModel resultModel) {
    if (resultModel.expression.length > 29) {
      expressionController.jumpTo(
        expressionController.position.maxScrollExtent + 12,
      );
    }
  }

  void addOperator(ResultModel resultModel, {required String input}) {
    if (hasOperator(resultModel.expression) &&
        resultModel.expression.endsWith(' ')) {
      resultModel.expression = resultModel.expression
              .substring(0, resultModel.expression.length - 3) +
          input;

      try {
        resultModel.result = evaluateExp(resultModel);
      } catch (e) {
        emit(CalculateFailed.override(resultModel, errMsg: e.toString()));
      }
      scrollExp(resultModel);

      emit(CalculateSuccess(resultModel));
    } else {
      resultModel.expression = resultModel.expression + input;
      try {
        resultModel.result = evaluateExp(resultModel);
      } catch (e) {
        emit(CalculateFailed.override(resultModel, errMsg: e.toString()));
      }
      scrollExp(resultModel);
      emit(CalculateSuccess(resultModel));
    }
  }

  void clearAll(ResultModel resultModel) {
    emit(CalculateSuccess(ResultModel()));
  }

  void clearLast(ResultModel resultModel) {
    if (resultModel.expression.isNotEmpty) {
      if (resultModel.expression[resultModel.expression.length - 1] == ' ') {
        resultModel.expression = resultModel.expression
            .substring(0, resultModel.expression.length - 3);
        resultModel.result = evaluateExp(resultModel);

        emit(CalculateSuccess(resultModel));
      } else {
        resultModel.expression = resultModel.expression
            .substring(0, resultModel.expression.length - 1);
        resultModel.result = evaluateExp(resultModel);

        emit(CalculateSuccess(resultModel));
      }
    }
  }

  String evaluateExp(ResultModel resultModel) {
    if (resultModel.expression.isNotEmpty) {
      if (hasOperator(resultModel.expression)) {
        if (resultModel.expression[resultModel.expression.length - 1] != ' ') {
          final output = MathNodeExpression.fromString(resultModel.expression)
              .calc(MathVariableValues.none);

          resultModel.result = output
              .toStringAsFixed(2)
              .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");

          return resultModel.result;
        }
      }
    }
    return '';
  }

  void equalButton(ResultModel resultModel) {
    if (resultModel.result.isNotEmpty) {
      resultModel.expression = resultModel.result;
      emit(CalculateSuccess(resultModel));
    }
  }

  void decPointButton(ResultModel resultModel) {
    if (!resultModel.expression.endsWith('.')) {
      addNumber(resultModel, input: '.');
      emit(CalculateSuccess(resultModel));
    }
  }

  void fetchMemory(ResultModel resultModel) {
    emit(CalculateSuccess(resultModel));
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
}
