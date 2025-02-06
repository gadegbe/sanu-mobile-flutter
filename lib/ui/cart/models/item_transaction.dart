import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Column, Table;
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/core/databases/database.dart';
import 'package:sanu/ui/core/databases/mixins/table_mixin.dart';
import 'package:sanu/ui/core/models/model.dart';
import 'package:sanu/ui/item/models/item.dart';

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

class ItemTransactionTable extends Table with TableMixin {
  late final type = textEnum<ItemTransactionType>()();
  late final quantity = text().named('price')();
  late final item = text().references(ItemTable, #id)();
  @override
  Set<Column> get primaryKey => {id};
}

class ItemTransaction extends Equatable implements Model {
  const ItemTransaction({
    required this.createdAt,
    required this.updatedAt,
    required this.itemId,
    required this.quantity,
    required this.type,
  });

  factory ItemTransaction.fromData(ItemTransactionTableData data) {
    return ItemTransaction(
      itemId: data.item,
      quantity: Decimal.parse(data.quantity),
      type: data.type,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

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
        createdAt,
        updatedAt,
      ];
}
