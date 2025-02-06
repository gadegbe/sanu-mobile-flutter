import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/cart/utils/transactions_utils.dart';
import 'package:sanu/ui/cart/widgets/transaction_type_switcher_widget.dart';
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    title: Text(context.l10n.total),
                    trailing: Text(total.toCurrencyFormat(context)),
                  ),
                  const TransactionTypeSwitcherWidget(),
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
          ],
        );
      },
    );
  }
}
