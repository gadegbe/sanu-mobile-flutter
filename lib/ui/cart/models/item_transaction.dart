import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/core/models/model.dart';

part 'item_transaction.g.dart';

enum ItemTransactionType {
  add,
  remove;

  String title(BuildContext context) {
    switch (this) {
      case ItemTransactionType.add:
        return context.l10n.transactionAddMode;
      case ItemTransactionType.remove:
        return context.l10n.transactionRemoveMode;
    }
  }
}

@JsonSerializable()
class ItemTransaction extends Equatable implements Model {
  const ItemTransaction({
    required this.createdAt,
    required this.updatedAt,
    required this.itemId,
    required this.quantity,
    required this.type,
  });

  factory ItemTransaction.fromJson(Map<String, dynamic> json) => _$ItemTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTransactionToJson(this);

  final String itemId;
  final Decimal quantity;
  final ItemTransactionType type;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  List<Object?> get props => [
        itemId,
        quantity,
        type,
      ];
}
