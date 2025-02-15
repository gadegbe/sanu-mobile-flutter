import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/core/extensions/context_extension.dart';
import 'package:sanu/ui/core/extensions/decimal_extension.dart';
import 'package:sanu/ui/core/extensions/list_extension.dart';
import 'package:sanu/ui/item/models/item.dart';
import 'package:sanu/ui/item/utils/items_utils.dart';

class ItemSelectorWidget extends StatefulWidget {
  const ItemSelectorWidget({
    required this.item,
    super.key,
  });

  final Item item;

  @override
  State<ItemSelectorWidget> createState() => _ItemSelectorWidgetState();
}

class _ItemSelectorWidgetState extends State<ItemSelectorWidget> {
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
            final stocks = ItemsUtils.itemsInStock(context, itemId: widget.item.id);
            final isRemove = state.type == ItemTransactionType.remove;
            final isOutOfStocks = stocks == Decimal.zero;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.item.price.toCurrencyFormat(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (category != null)
                    Text(
                      category.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isOutOfStocks ? context.colorScheme.error : Colors.green,
                          shape: BoxShape.circle,
                        ),
                        width: 8,
                        height: 8,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        stocks.toString(),
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      const Spacer(),
                      InkWell(
                        child: const Icon(Icons.remove),
                        onTap: () {
                          quantityNotifier.value = quantityNotifier.value > Decimal.zero
                              ? quantityNotifier.value - Decimal.one
                              : Decimal.zero;
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: quantityNotifier,
                        builder: (context, quantity, _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                      InkWell(
                        child: const Icon(Icons.add),
                        onTap: () {
                          setState(() {
                            if (isRemove) {
                              quantityNotifier.value = quantityNotifier.value < maxQuantity
                                  ? quantityNotifier.value + Decimal.one
                                  : maxQuantity;
                            } else {
                              quantityNotifier.value = quantityNotifier.value + Decimal.one;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ].separated(separator: const SizedBox(height: 2)),
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
