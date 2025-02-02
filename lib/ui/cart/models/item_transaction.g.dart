// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTransaction _$ItemTransactionFromJson(Map<String, dynamic> json) =>
    ItemTransaction(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      quantity: Decimal.fromJson(json['quantity'] as String),
      type: $enumDecode(_$ItemTransactionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ItemTransactionToJson(ItemTransaction instance) =>
    <String, dynamic>{
      'item': instance.item,
      'quantity': instance.quantity,
      'type': _$ItemTransactionTypeEnumMap[instance.type]!,
    };

const _$ItemTransactionTypeEnumMap = {
  ItemTransactionType.add: 'add',
  ItemTransactionType.remove: 'remove',
};
