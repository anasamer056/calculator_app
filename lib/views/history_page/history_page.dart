import 'package:calculator_app/constants.dart';
import 'package:calculator_app/cubits/calculate_cubit/calculate_cubit.dart';
import 'package:calculator_app/cubits/memory_cubit/memory_cubit.dart';
import 'package:calculator_app/ui/global/theme/app_colors/app_colors_dark.dart';
import 'package:calculator_app/model/result_model.dart';
import 'package:calculator_app/views/history_page/custom_dialog_builder.dart';
import 'package:calculator_app/views/history_page/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemoryCubit, MemoryState>(
      builder: (context, state) {
        List historyList =
            Hive.box(expHistory).values.toList().reversed.toList();
        return Scaffold(
          appBar: AppBar(
            title: Text('History'),
            scrolledUnderElevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    customDialogBuilder(context);
                  },
                  icon: Icon(Icons.auto_delete_outlined)),
            ],
          ),
          body: ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: HistoryTile(
                    resultModel: historyList[index],
                  ));
            },
          ),
        );
      },
    );
  }
}
