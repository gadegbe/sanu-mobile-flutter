import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sanu/ui/category/models/item_category.dart';

@immutable
class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const {},
  });

  final Map<String, ItemCategory> categories;

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
