import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/item/models/item.dart';

part 'item_stock.g.dart';

@JsonSerializable()
class ItemStock {
  const ItemStock({
    required this.item,
    required this.quantity,
  });

  factory ItemStock.fromJson(Map<String, dynamic> json) => _$ItemStockFromJson(json);

  Map<String, dynamic> toJson() => _$ItemStockToJson(this);

  final Item item;
  final int quantity;
}
