// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockState _$StockStateFromJson(Map<String, dynamic> json) => StockState(
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => ItemTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stocks: (json['stocks'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, ItemStock.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$StockStateToJson(StockState instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'stocks': instance.stocks,
    };
