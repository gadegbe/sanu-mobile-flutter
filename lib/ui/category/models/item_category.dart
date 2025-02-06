import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:sanu/ui/core/databases/database.dart';
import 'package:sanu/ui/core/databases/mixins/table_mixin.dart';
import 'package:sanu/ui/core/models/model.dart';

class ItemCategoryTable extends Table with TableMixin {
  late final name = text()();
  late final description = text()();
  late final image = text()();
  @override
  Set<Column> get primaryKey => {id};
}

class ItemCategory extends Equatable implements Model {
  const ItemCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ItemCategory.fromData(ItemCategoryTableData data) {
    return ItemCategory(
      id: data.id,
      name: data.name,
      image: data.image,
      description: data.description,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  final String id;
  final String name;
  final String image;
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  List<Object> get props => [
        id,
        name,
        image,
        description,
        createdAt,
        updatedAt,
      ];
}
