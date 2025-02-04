import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';
import 'package:sanu/ui/stock/models/item_stock.dart';

part 'stock_state.g.dart';

@immutable
@JsonSerializable()
class StockState extends Equatable {
  const StockState({
    this.transactions = const [],
    this.stocks = const {},
  });

  factory StockState.fromJson(Map<String, dynamic> json) => _$StockStateFromJson(json);

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

  Map<String, dynamic> toJson() => _$StockStateToJson(this);

  @override
  List<Object> get props => [
        transactions,
        stocks,
      ];
}
