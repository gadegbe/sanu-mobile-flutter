import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/core/models/model.dart';

part 'item_category.g.dart';

@JsonSerializable()
class ItemCategory extends Equatable implements Model {
  const ItemCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
  factory ItemCategory.fromJson(Map<String, dynamic> json) => _$ItemCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCategoryToJson(this);

  final String id;
  final String name;
  final String image;
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  List<Object> get props => [id, name, image, description];
}
