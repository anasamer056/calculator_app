part of 'calculate_cubit.dart';

@immutable
abstract class CalculateState extends Equatable {
  final ResultModel resultModel;

  CalculateState(this.resultModel);
}

class CalculateInitial extends CalculateState {
  CalculateInitial(super.resultModel);

  @override
  List<Object?> get props => [resultModel];
}

class CalculateSuccess extends CalculateState {
  CalculateSuccess(super.resultModel);

  // factory CalculateSuccess.override(ResultModel resultModel) {
  //   return CalculateSuccess(ResultModel(
  //       expression: resultModel.expression, result: resultModel.result));
  // }
  @override
  List<Object?> get props => [resultModel];
}

class CalculateFailed extends CalculateState {
  CalculateFailed(super.resultModel, this.errMsg);
  final String errMsg;

  factory CalculateFailed.override(ResultModel resultModel,
      {required String errMsg}) {
    return CalculateFailed(
        ResultModel(result: '', expression: resultModel.expression), errMsg);
  }

  @override
  List<Object?> get props => [resultModel];
}
