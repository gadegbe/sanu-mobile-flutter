import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/cart/utils/transactions_utils.dart';
import 'package:sanu/ui/core/extensions/decimal_extension.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        final total = TransactionsUtils.total(context, transactions: state.transactions.values.toList());
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.transactions.values.length,
                itemBuilder: (context, index) {
                  final transaction = state.transactions.values.elementAt(index);
                  final item = context.read<ItemCubit>().state.items[transaction.itemId];
                  if (item == null) return const SizedBox();

                  final price = item.price * transaction.quantity;

                  return ListTile(
                    leading: Text(transaction.quantity.toString()),
                    title: Text(item.name),
                    trailing: Text(price.toCurrencyFormat(context)),
                  );
                },
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(context.l10n.total),
                      trailing: Text(total.toCurrencyFormat(context)),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Row(
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
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<StockCubit>().commit(state.transactions.values.toList());
                        context.read<TransactionCubit>().reset();
                      },
                      child: Text(context.l10n.checkout),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
