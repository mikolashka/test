import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/validations/validations.dart';
import '../../../data/models/operation_type.dart';
import '../../utils/app_colors.dart';
import '../../utils/general_widgets/primary_button.dart';
import '../../utils/general_widgets/simple_input.dart';
import '../bloc/main_bloc.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  late TextEditingController _dateTransaction;
  late TextEditingController _sum;
  late TextEditingController _commission;
  late TextEditingController _total;
  late TextEditingController _numberTransaction;
  late TextEditingController _operationType;
  OperationType? selectOperationType;
  late MainBloc mainBloc;

  final _formKey = GlobalKey<FormState>();
  DateTime? lastDate = DateTime.now();

  @override
  void initState() {
    _dateTransaction = TextEditingController();
    _sum = TextEditingController();
    _commission = TextEditingController();
    _total = TextEditingController();
    _numberTransaction = TextEditingController();
    _operationType = TextEditingController();
    mainBloc = BlocProvider.of<MainBloc>(context);
    mainBloc.add(const FetchUserTransactionsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _dateTransaction.dispose();
    _sum.dispose();
    _commission.dispose();
    _total.dispose();
    _numberTransaction.dispose();
    _operationType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => context.router.pop(),
            child: const Icon(
              Icons.close,
              color: AppColors.dirtyWhite,
            )),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleInputLayout(
                  title: 'Дата транзакции',
                  readOnly: true,
                  validator: Validations.notNull,
                  onClick: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColors.background,
                      clipBehavior: Clip.hardEdge,
                      constraints: const BoxConstraints(maxHeight: 290),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppColors.background,
                              ),
                              height: 42,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context.router.pop();
                                    _dateTransaction.text = lastDate != null
                                        ? lastDate.toString()
                                        : _dateTransaction.text;
                                    setState(() {});
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Готово',
                                      style: TextStyle(color: AppColors.dirtyWhite),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 216,
                              padding: const EdgeInsets.only(top: 6.0),
                              color: AppColors.background,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  color: AppColors.dirtyWhite,
                                  fontSize: 22.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: SafeArea(
                                    top: false,
                                    child: CupertinoDatePicker(
                                      backgroundColor: AppColors.background,
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: DateTime.now(),
                                      maximumDate: DateTime.now(),
                                      use24hFormat: true,
                                      onDateTimeChanged: (value) {
                                        lastDate = value;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  controller: _dateTransaction,
                ),
                const SizedBox(height: 16),
                SimpleInputLayout(
                  title: 'Сумма',
                  validator: Validations.notNull,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: _sum,
                ),
                const SizedBox(height: 16),
                SimpleInputLayout(
                  title: 'Комиссия',
                  validator: Validations.notNull,
                  keyboardType: TextInputType.number,
                  controller: _commission,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                SimpleInputLayout(
                  title: 'Итого',
                  validator: Validations.notNull,
                  keyboardType: TextInputType.number,
                  controller: _total,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                SimpleInputLayout(
                  title: 'Номер транзакции',
                  validator: Validations.notNull,
                  controller: _numberTransaction,
                ),
                const SizedBox(height: 16),
                SimpleInputLayout(
                  title: 'Тип операции',
                  readOnly: true,
                  validator: Validations.notNull,
                  onClick: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: const BoxConstraints(minWidth: double.infinity, maxHeight: 400),
                      builder: (BuildContext context) {
                        return Wrap(
                          children: List.generate(
                            OperationType.values.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                              child: ListTile(
                                onTap: () => _selectOperationType(OperationType.values[index]),
                                title: Text(OperationType.values[index].displayValue()),
                                subtitle: const Divider(
                                  color: AppColors.grayText,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  controller: _operationType,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryElevationButton(
                    title: 'Сохранить',
                    onPressed: _saveTransaction,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveTransaction() {
    if (!_formKey.currentState!.validate()) return;
    mainBloc.add(SaveTransactionEvent(
        dateTransaction: lastDate?.toString() ?? '',
        sum: _sum.text,
        commission: _commission.text,
        total: _total.text,
        numberTransaction: _numberTransaction.text,
        operationType: selectOperationType!));
  }

  void _selectOperationType(OperationType operationType) {
    context.router.pop();
    setState(
      () {
        _operationType.text = operationType.displayValue();
      },
    );
    selectOperationType = operationType;
  }
}
