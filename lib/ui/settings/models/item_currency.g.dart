// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCurrency _$ItemCurrencyFromJson(Map<String, dynamic> json) => ItemCurrency(
      name: json['name'] as String,
      code: json['code'] as String,
      digits: (json['digits'] as num?)?.toInt() ?? 2,
    );

Map<String, dynamic> _$ItemCurrencyToJson(ItemCurrency instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'digits': instance.digits,
    };
