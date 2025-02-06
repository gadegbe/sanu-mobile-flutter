import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/core/extensions/context_layout_extension.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/item/widgets/item_selector_horizontal_widget.dart';
import 'package:sanu/ui/item/widgets/item_selector_widget.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';

class ItemsSelectorWidget extends StatelessWidget {
  const ItemsSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockCubit, StockState>(
      builder: (context, state) {
        return BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, transactionState) {
            final category = transactionState.selectedCategory;
            final selectedMode = transactionState.type;

            return BlocBuilder<ItemCubit, ItemState>(
              builder: (context, state) {
                final items = state.items.values
                    .where((element) => category == null || element.categoryId == category.id)
                    .toList();
                if (context.isGridView) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: context.crossAxisCount,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items.elementAt(index);
                      return Card(
                        child: ItemSelectorWidget(
                          key: ValueKey('${item.id}-$selectedMode'),
                          item: item,
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items.elementAt(index);
                      return Card(
                        child: ItemSelectorHorizontalWidget(
                          key: ValueKey('${item.id}-$selectedMode'),
                          item: item,
                        ),
                      );
                    },
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
