part of 'calculate_cubit.dart';

@immutable
abstract class CalculateState extends Equatable {
  final ResultModel resultModel;

  const CalculateState(this.resultModel);
}

class CalculateInitial extends CalculateState {
  const CalculateInitial(super.resultModel);

  @override
  List<Object?> get props => [resultModel];
}

class CalculateSuccess extends CalculateState {
  const CalculateSuccess(super.resultModel);

  factory CalculateSuccess.override(ResultModel resultModel) {
    return CalculateSuccess(ResultModel(
        expression: resultModel.expression, result: resultModel.result));
  }

  @override
  List<Object?> get props => [resultModel];
}

class CalculateFailed extends CalculateState {
  const CalculateFailed(super.resultModel, this.errMsg);
  final String errMsg;

  factory CalculateFailed.copyWith(ResultModel resultModel,
      {required String errMsg}) {
    return CalculateFailed(
        ResultModel(result: '', expression: resultModel.expression), errMsg);
  }

  @override
  List<Object?> get props => [resultModel];
}
