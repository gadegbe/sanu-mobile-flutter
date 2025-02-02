import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanu/ui/item/models/item.dart';

part 'item_state.g.dart';

@immutable
@JsonSerializable()
class ItemState extends Equatable {
  const ItemState({
    this.items = const {},
  });

  factory ItemState.fromJson(Map<String, dynamic> json) => _$ItemStateFromJson(json);

  final Map<String, Item> items;

  Map<String, dynamic> toJson() => _$ItemStateToJson(this);

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
