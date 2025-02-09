import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sanu/ui/item/models/item.dart';

@immutable
class ItemState extends Equatable {
  const ItemState({
    this.items = const {},
    this.filteredItems = const [],
  });

  final Map<String, Item> items;
  final List<Item> filteredItems;

  ItemState copyWith({
    Map<String, Item>? items,
    List<Item>? filteredItems,
  }) {
    return ItemState(
      items: items ?? this.items,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }

  @override
  List<Object> get props => [
        items,
        filteredItems,
      ];
}
