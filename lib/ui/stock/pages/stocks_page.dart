import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';

class StocksPage extends StatelessWidget {
  const StocksPage({super.key});

  static String name = 'stocks';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                context.l10n.stocksTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<StockCubit, StockState>(
            builder: (context, state) {
              return Table(
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text(
                        context.l10n.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        context.l10n.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        context.l10n.actions,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  ...state.stocks.values
                      .map(
                        (stock) {
                          final item = context.read<ItemCubit>().state.items[stock.itemId];
                          if (item == null) return null;

                          return TableRow(
                            children: [
                              Text(item.name),
                              Text(stock.quantity.toString()),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Symbols.visibility),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      )
                      .where((element) => element != null)
                      .cast<TableRow>(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
