import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/stock/models/item_stock.dart';

@immutable
class StockState extends Equatable {
  const StockState({
    this.transactions = const [],
    this.stocks = const {},
  });

  final List<ItemTransaction> transactions;
  final Map<String, ItemStock> stocks;

  StockState copyWith({
    List<ItemTransaction>? transactions,
    Map<String, ItemStock>? stocks,
  }) {
    return StockState(
      transactions: transactions ?? this.transactions,
      stocks: stocks ?? this.stocks,
    );
  }

  @override
  List<Object> get props => [
        transactions,
        stocks,
      ];
}
