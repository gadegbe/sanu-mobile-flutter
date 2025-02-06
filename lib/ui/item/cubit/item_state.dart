import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sanu/ui/item/models/item.dart';

@immutable
class ItemState extends Equatable {
  const ItemState({
    this.items = const {},
  });

  final Map<String, Item> items;

  ItemState copyWith({
    Map<String, Item>? items,
  }) {
    return ItemState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}
