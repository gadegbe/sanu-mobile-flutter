// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemStock _$ItemStockFromJson(Map<String, dynamic> json) => ItemStock(
      itemId: json['itemId'] as String,
      quantity: Decimal.fromJson(json['quantity'] as String),
    );

Map<String, dynamic> _$ItemStockToJson(ItemStock instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'quantity': instance.quantity,
    };
