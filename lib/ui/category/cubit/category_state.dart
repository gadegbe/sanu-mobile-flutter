import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sanu/ui/category/models/item_category.dart';

@immutable
class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const {},
    this.filteredCategories = const [],
  });

  final Map<String, ItemCategory> categories;
  final List<ItemCategory> filteredCategories;

  CategoryState copyWith({
    Map<String, ItemCategory>? categories,
    List<ItemCategory>? filteredCategories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      filteredCategories: filteredCategories ?? this.filteredCategories,
    );
  }

  @override
  List<Object> get props => [
        categories,
        filteredCategories,
      ];
}
