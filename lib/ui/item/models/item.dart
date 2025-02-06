import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/core/databases/database.dart';
import 'package:sanu/ui/core/databases/mixins/table_mixin.dart';
import 'package:sanu/ui/core/models/model.dart';

class ItemTable extends Table with TableMixin {
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get image => text()();
  TextColumn get price => text().named('price')();
  TextColumn get category => text().references(ItemCategoryTable, #id)();
  @override
  Set<Column> get primaryKey => {id};
}

class Item extends Equatable implements Model {
  const Item({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Item.fromData(ItemTableData data) {
    return Item(
      id: data.id,
      name: data.name,
      image: data.image,
      description: data.description,
      price: Decimal.parse(data.price),
      categoryId: data.category,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  final String id;

  final String name;
  final String image;
  final String description;
  final Decimal price;
  final String categoryId;
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
        price,
        categoryId,
        createdAt,
        updatedAt,
      ];
}
