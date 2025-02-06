import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_stock.g.dart';

@JsonSerializable()
class ItemStock extends Equatable {
  const ItemStock({
    required this.itemId,
    required this.quantity,
  });

  factory ItemStock.fromJson(Map<String, dynamic> json) => _$ItemStockFromJson(json);

  Map<String, dynamic> toJson() => _$ItemStockToJson(this);

  final String itemId;
  final Decimal quantity;

  @override
  List<Object?> get props => [itemId, quantity];
}
