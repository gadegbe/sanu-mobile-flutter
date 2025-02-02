import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/category/models/item_category.dart';

part 'category_state.g.dart';

@immutable
@JsonSerializable()
class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const {},
  });

  factory CategoryState.fromJson(Map<String, dynamic> json) => _$CategoryStateFromJson(json);

  final Map<String, ItemCategory> categories;

  Map<String, dynamic> toJson() => _$CategoryStateToJson(this);

  CategoryState copyWith({
    Map<String, ItemCategory>? categories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object> get props => [categories];
}
