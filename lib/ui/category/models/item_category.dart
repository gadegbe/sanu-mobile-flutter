import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_category.g.dart';

@JsonSerializable()
class ItemCategory extends Equatable {
  const ItemCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });
  factory ItemCategory.fromJson(Map<String, dynamic> json) => _$ItemCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCategoryToJson(this);

  final String id;
  final String name;
  final String image;
  final String description;

  ItemCategory copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
  }) {
    return ItemCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props => [id, name, image, description];
}
