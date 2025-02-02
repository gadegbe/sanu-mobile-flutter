// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemStock _$ItemStockFromJson(Map<String, dynamic> json) => ItemStock(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$ItemStockToJson(ItemStock instance) => <String, dynamic>{
      'item': instance.item,
      'quantity': instance.quantity,
    };
