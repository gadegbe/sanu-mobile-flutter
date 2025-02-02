import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/category/models/item_category.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  const Item({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  final String id;

  final String name;
  final String image;
  final String description;
  final Decimal price;
  final ItemCategory category;

  @override
  List<Object> get props => [
        id,
        name,
        image,
        description,
        price,
        category,
      ];
}
