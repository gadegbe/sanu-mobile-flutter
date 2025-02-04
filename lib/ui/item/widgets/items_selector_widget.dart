import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/item/widgets/item_selector_widget.dart';

class ItemsSelectorWidget extends StatelessWidget {
  const ItemsSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, transactionState) {
        final category = transactionState.selectedCategory;
        final selectedMode = transactionState.type;

        return BlocBuilder<ItemCubit, ItemState>(
          builder: (context, state) {
            final items =
                state.items.values.where((element) => category == null || element.categoryId == category.id).toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
          },
        );
      },
    );
  }
}
