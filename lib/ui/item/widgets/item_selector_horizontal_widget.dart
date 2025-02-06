import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/item/models/item.dart';
import 'package:sanu/ui/item/utils/items_utils.dart';

class ItemSelectorHorizontalWidget extends StatefulWidget {
  const ItemSelectorHorizontalWidget({
    required this.item,
    super.key,
  });

  final Item item;

  @override
  State<ItemSelectorHorizontalWidget> createState() => _ItemSelectorHorizontalWidgetState();
}

class _ItemSelectorHorizontalWidgetState extends State<ItemSelectorHorizontalWidget> {
  final quantityNotifier = ValueNotifier(Decimal.zero);
  Decimal maxQuantity = Decimal.zero;

  @override
  void initState() {
    maxQuantity = ItemsUtils.itemsInStock(context, itemId: widget.item.id);
    final quantity = context.read<TransactionCubit>().state.transactions[widget.item.id]?.quantity;
    if (quantity != null) {
      quantityNotifier.value = quantity;
    }
    _updateTransaction();
    quantityNotifier.addListener(_updateTransaction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, categoryState) {
        final category = categoryState.categories[widget.item.categoryId];
        return BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            //final stocks = ItemsUtils.itemsInStock(context, itemId: widget.item.id);
            final isRemove = state.type == ItemTransactionType.remove;
            return ListTile(
              title: Text(
                widget.item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: category != null
                  ? Text(
                      category.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      quantityNotifier.value =
                          quantityNotifier.value > Decimal.zero ? quantityNotifier.value - Decimal.one : Decimal.zero;
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: quantityNotifier,
                    builder: (context, quantity, _) {
                      return Text(
                        quantity.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        if (isRemove) {
                          quantityNotifier.value =
                              quantityNotifier.value < maxQuantity ? quantityNotifier.value + Decimal.one : maxQuantity;
                        } else {
                          quantityNotifier.value = quantityNotifier.value + Decimal.one;
                        }
                      });
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

  void _updateTransaction() {
    final quantity = quantityNotifier.value;
    context.read<TransactionCubit>().upsertTransaction(
          itemId: widget.item.id,
          quantity: quantity,
        );
  }
}
