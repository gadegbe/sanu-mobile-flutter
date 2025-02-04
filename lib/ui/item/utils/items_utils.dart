import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';

abstract class ItemsUtils {
  static Decimal itemsInStock(BuildContext context, {required String itemId}) {
    return context.read<StockCubit>().state.stocks[itemId]?.quantity ?? Decimal.zero;
  }
}
