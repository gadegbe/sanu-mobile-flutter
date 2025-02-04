// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTransaction _$ItemTransactionFromJson(Map<String, dynamic> json) =>
    ItemTransaction(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      itemId: json['itemId'] as String,
      quantity: Decimal.fromJson(json['quantity'] as String),
      type: $enumDecode(_$ItemTransactionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ItemTransactionToJson(ItemTransaction instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'type': _$ItemTransactionTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ItemTransactionTypeEnumMap = {
  ItemTransactionType.add: 'add',
  ItemTransactionType.remove: 'remove',
};
