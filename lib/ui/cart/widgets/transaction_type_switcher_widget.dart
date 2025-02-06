import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';

class TransactionTypeSwitcherWidget extends StatelessWidget {
  const TransactionTypeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ItemTransactionType.remove.title(context)),
            const SizedBox(width: 8),
            Switch(
              value: context.read<TransactionCubit>().state.type == ItemTransactionType.add,
              onChanged: (_) {
                context.read<TransactionCubit>().switchTransactionType();
              },
            ),
            const SizedBox(width: 8),
            Text(ItemTransactionType.add.title(context)),
          ],
        );
      },
    );
  }
}
