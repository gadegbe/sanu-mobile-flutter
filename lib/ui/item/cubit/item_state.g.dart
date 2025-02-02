// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemState _$ItemStateFromJson(Map<String, dynamic> json) => ItemState(
      items: (json['items'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Item.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$ItemStateToJson(ItemState instance) => <String, dynamic>{
      'items': instance.items,
    };
