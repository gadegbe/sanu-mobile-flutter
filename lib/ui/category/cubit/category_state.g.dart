// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryState _$CategoryStateFromJson(Map<String, dynamic> json) =>
    CategoryState(
      categories: (json['categories'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, ItemCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$CategoryStateToJson(CategoryState instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
