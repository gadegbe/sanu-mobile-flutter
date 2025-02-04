import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_currency.g.dart';

@JsonSerializable()
class ItemCurrency extends Equatable {
  const ItemCurrency({
    required this.name,
    required this.code,
    this.digits = 2,
  });

  factory ItemCurrency.fromJson(Map<String, dynamic> json) => _$ItemCurrencyFromJson(json);

  final String name;
  final String code;
  final int digits;

  Map<String, dynamic> toJson() => _$ItemCurrencyToJson(this);

  static const ItemCurrency defaultCurrency = ItemCurrency(name: 'West African CFA Franc', code: 'XOF', digits: 0);

  @override
  List<Object?> get props => [code, name, digits];
}
