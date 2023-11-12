import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:devtools_test/data/models/operation_type.dart';
import 'package:devtools_test/presentation/main/widgets/add_transaction_screen.dart';
import 'package:devtools_test/presentation/main/widgets/transaction_list_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/router.dart';
import '../../data/models/main_screen_model.dart';
import '../utils/app_colors.dart';
import 'bloc/main_bloc.dart';

@RoutePage(name: RouteNames.main)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  OperationType? touchedOperationType;
  late MainBloc mainBloc;

  @override
  void initState() {
    mainBloc = BlocProvider.of<MainBloc>(context);
    mainBloc.add(const FetchUserTransactionsEvent());
    super.initState();
  }

  @override
  void dispose() {
    mainBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 400,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedOperationType = null;
                                return;
                              }
                              touchedOperationType = OperationType
                                  .values[pieTouchResponse.touchedSection!.touchedSectionIndex];
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: showingSections(state.model),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList.separated(
                itemBuilder: (BuildContext context, int index) {
                  final item = state.model!.transactionList[index];
                  return TransactionListItem(
                    item: item,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: state.model?.transactionList.length ?? 0,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.dirtyWhite,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (context) => const AddTransactionScreen(),
              );
            },
            child: const Icon(
              Icons.add,
            ),
          ));
    });
  }

  List<PieChartSectionData> showingSections(MainScreenModel? model) {
    return List.generate(OperationType.values.length, (i) {
      final isTouched = OperationType.values[i] == touchedOperationType;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (OperationType.values[i]) {
        case OperationType.replenishment:
          return PieChartSectionData(
            color: AppColors.blue,
            value: model?.replenishmentPercent,
            title:
                '${model?.replenishmentPercent.toInt()}%\n${OperationType.replenishment.displayValue()}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.dirtyWhite,
              shadows: shadows,
            ),
          );
        case OperationType.transfer:
          return PieChartSectionData(
            color: AppColors.green,
            value: model?.transferPercent,
            title: '${model?.transferPercent.toInt()}%\n${OperationType.transfer.displayValue()}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.dirtyWhite,
              shadows: shadows,
            ),
          );
        case OperationType.withdrawal:
          return PieChartSectionData(
            color: AppColors.red,
            value: model?.withdrawalPercent,
            title:
                '${model?.withdrawalPercent.toInt()}%\n${OperationType.withdrawal.displayValue()}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.grayText,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
