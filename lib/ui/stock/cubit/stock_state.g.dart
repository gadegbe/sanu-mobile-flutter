// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockState _$StockStateFromJson(Map<String, dynamic> json) => StockState(
      transactions: (json['transactions'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, ItemTransaction.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$StockStateToJson(StockState instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };
