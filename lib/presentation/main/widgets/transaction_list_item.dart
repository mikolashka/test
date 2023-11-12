import 'package:auto_route/auto_route.dart';
import 'package:devtools_test/data/models/transaction_model.dart';
import 'package:devtools_test/presentation/utils/general_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_colors.dart';
import '../bloc/main_bloc.dart';

class TransactionListItem extends StatefulWidget {
  final TransactionModel item;

  const TransactionListItem({super.key, required this.item});

  @override
  State<StatefulWidget> createState() =>_TransactionListItemState();
}
class _TransactionListItemState extends State<TransactionListItem>{
  late MainBloc mainBloc;

@override
  void initState() {
    mainBloc =   BlocProvider.of<MainBloc>(context);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.item.operationType.displayValue()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.item.total),
            Text(widget.item.numberTransaction),
          ],
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.dirtyWhite,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Wrap(
                  children: [
                    TransactionInfoItem(
                      header: 'Дата транзакции',
                      value: widget.item.dateTransaction,
                    ),
                    TransactionInfoItem(
                      header: 'Сумма',
                      value: widget.item.sum,
                    ),
                    TransactionInfoItem(
                      header: 'Комиссия',
                      value: widget.item.commission,
                    ),
                    TransactionInfoItem(
                      header: 'Итого',
                      value:widget.item.total,
                    ),
                    TransactionInfoItem(
                      header: 'Тип операции',
                      value: widget.item.operationType.displayValue(),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryElevationButton(
                        title: 'Удалить',

                        onPressed: () {
                          context.router.pop();
                          mainBloc.add(RemoveItemEvent(widget.item.id!));
                        },
                      ),
                    ),
                    const SizedBox(height: 100,),
                  ],
                ),
              );
            },
          );
        });
  }
}

class TransactionInfoItem extends StatelessWidget {
  final String header;
  final String value;

  const TransactionInfoItem({super.key, required this.header, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(header),
      subtitle: Text(value),
    );
  }
}
