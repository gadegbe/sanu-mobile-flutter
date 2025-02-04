import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';

abstract class TransactionsUtils {
  static Decimal total(BuildContext context, {required List<ItemTransaction> transactions}) {
    return transactions.fold(Decimal.zero, (sum, transaction) {
      final item = context.read<ItemCubit>().state.items[transaction.itemId];
      return sum + transaction.quantity * (item?.price ?? Decimal.zero);
    });
  }
}
