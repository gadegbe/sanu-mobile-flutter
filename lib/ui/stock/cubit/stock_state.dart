import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/cart/models/item_transaction.dart';

part 'stock_state.g.dart';

@immutable
@JsonSerializable()
class StockState extends Equatable {
  const StockState({
    this.transactions = const {},
  });

  factory StockState.fromJson(Map<String, dynamic> json) => _$StockStateFromJson(json);

  final Map<String, ItemTransaction> transactions;
  Map<String, dynamic> toJson() => _$StockStateToJson(this);

  @override
  List<Object> get props => [transactions];
}
