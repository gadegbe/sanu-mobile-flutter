import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/core/databases/database.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/item/models/item.dart';
import 'package:uuid/uuid.dart';

part 'item_mock.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit({
    required this.database,
    required this.categoryCubit,
  }) : super(const ItemState()) {
    load();
  }

  final AppDatabase database;
  final CategoryCubit categoryCubit;

  Future<void> load() async {
    final items = await database.select(database.itemTable).get();

    final itemsMap = <String, Item>{};
    for (final item in items) {
      itemsMap[item.id] = Item.fromData(item);
    }
    emit(state.copyWith(items: itemsMap));
    filterItems();
  }

  Future<void> upsertItem({
    required String name,
    required String description,
    required ItemCategory category,
    required Decimal price,
    String? image,
    String? id,
  }) async {
    final itemId = id ?? const Uuid().v4();
    final createdAt = state.items[itemId]?.createdAt ?? DateTime.now();
    await database.into(database.itemTable).insertOnConflictUpdate(
          ItemTableData(
            id: itemId,
            name: name,
            description: description,
            price: price.toString(),
            category: category.id,
            image: image ?? 'https://placehold.co/400',
            createdAt: createdAt,
            updatedAt: DateTime.now(),
          ),
        );

    await load();
  }

  void filterItems({String? filter}) {
    final filteredItems = (filter == null || filter.isEmpty
            ? state.items.values
            : state.items.values.where((item) {
                final category = categoryCubit.state.categories[item.categoryId];

                final nameMatch = item.name.toLowerCase().contains(filter.toLowerCase());
                final descriptionMatch = item.description.toLowerCase().contains(filter.toLowerCase());

                final categoryNameMatch = category?.name.toLowerCase().contains(filter.toLowerCase()) ?? false;
                final categoryDescriptionMatch =
                    category?.description.toLowerCase().contains(filter.toLowerCase()) ?? false;

                return nameMatch || descriptionMatch || categoryNameMatch || categoryDescriptionMatch;
              }))
        .toList();
  
    emit(state.copyWith(filteredItems: filteredItems));
  }

  Future<void> deleteItem(String itemId) async {
    await (database.delete(database.itemTable)..where((tbl) => tbl.id.equals(itemId))).go();
    await load();
  }
}
