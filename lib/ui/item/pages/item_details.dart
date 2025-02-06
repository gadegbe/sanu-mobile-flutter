import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/core/extensions/context_extension.dart';
import 'package:sanu/ui/core/extensions/decimal_extension.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    required this.id,
    super.key,
  });

  static String name = 'item-details';

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockCubit, StockState>(
      builder: (context, stockState) {
        return BlocBuilder<ItemCubit, ItemState>(
          builder: (context, state) {
            final item = state.items[id];
            final stock = stockState.stocks[id];
            final transactions = stockState.transactions.where((transaction) => transaction.itemId == id).sorted(
                  (a, b) => b.createdAt.compareTo(a.createdAt),
                );
            if (item == null) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Symbols.grocery,
                        size: 128,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name),
                          Text(item.description),
                          Text((stock?.quantity ?? Decimal.zero).toString()),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    context.l10n.stocksMove,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                  BlocBuilder<StockCubit, StockState>(
                    builder: (context, stockState) {
                      return BlocBuilder<ItemCubit, ItemState>(
                        builder: (context, state) {
                          return Table(
                            border: TableBorder.all(
                              color: Theme.of(context).colorScheme.onSurface.withAlpha(50),
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(),
                              1: IntrinsicColumnWidth(),
                              2: IntrinsicColumnWidth(),
                              3: IntrinsicColumnWidth(),
                              4: IntrinsicColumnWidth(),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'Product',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    'Quantity',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    'Value',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    'Date',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ].map((e) => Padding(padding: const EdgeInsets.all(8), child: e)).toList(),
                              ),
                              ...transactions.map(
                                (transaction) => TableRow(
                                  children: [
                                    Text(item.name),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          transaction.quantity.toString(),
                                          textAlign: TextAlign.right,
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          transaction.type == ItemTransactionType.add
                                              ? Symbols.arrow_upward
                                              : Symbols.arrow_downward,
                                          color: transaction.type == ItemTransactionType.add
                                              ? Colors.greenAccent
                                              : context.colorScheme.error,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      (item.price * transaction.quantity).toCurrencyFormat(context),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy HH:mm:ss').format(transaction.createdAt),
                                    ),
                                  ]
                                      .map(
                                        (e) => TableCell(
                                          verticalAlignment: TableCellVerticalAlignment.middle,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: e,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
