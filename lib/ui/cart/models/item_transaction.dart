import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/item/models/item.dart';

part 'item_transaction.g.dart';

enum ItemTransactionType {
  add,
  remove,
}

@JsonSerializable()
class ItemTransaction extends Equatable {
  const ItemTransaction({
    required this.item,
    required this.quantity,
    required this.type,
  });

  factory ItemTransaction.fromJson(Map<String, dynamic> json) => _$ItemTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTransactionToJson(this);

  final Item item;
  final Decimal quantity;
  final ItemTransactionType type;

  @override
  List<Object?> get props => [
        item,
        quantity,
        type,
      ];
}
