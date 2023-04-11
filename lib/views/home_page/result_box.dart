import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculateCubit, CalculateState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: RangeMaintainingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: BlocProvider.of<CalculateCubit>(context)
                      .expressionController,
                  child: Text(
                    state.resultModel.expression,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight,
                  child: Text(state.resultModel.result,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .fontSize)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
