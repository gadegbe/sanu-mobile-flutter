import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/core/databases/database.dart';
import 'package:uuid/uuid.dart';

part 'category_mock.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.database}) : super(const CategoryState()) {
    load();
  }
  final AppDatabase database;

  Future<void> load() async {
    final categories = await database.select(database.itemCategoryTable).get();
    final categoriesMap = <String, ItemCategory>{};
    for (final category in categories) {
      categoriesMap[category.id] = ItemCategory.fromData(category);
    }
    emit(state.copyWith(categories: categoriesMap));
    filterCategories();
  }

  ItemCategory? readCategory(String id) {
    return state.categories[id];
  }

  Future<void> upsertCategory({
    required String name,
    required String description,
    String? id,
    String? image,
  }) async {
    final categoryId = id ?? const Uuid().v4();
    final createdAt = state.categories[categoryId]?.createdAt ?? DateTime.now();

    await database.into(database.itemCategoryTable).insertOnConflictUpdate(
          ItemCategoryTableData(
            id: categoryId,
            name: name,
            description: description,
            image: image ?? 'https://placehold.co/400',
            createdAt: createdAt,
            updatedAt: DateTime.now(),
          ),
        );

    await load();
  }

  void filterCategories({String? filter}) {
    final filteredCategories = (filter == null || filter.isEmpty
            ? state.categories.values
            : state.categories.values.where((category) {
                final nameMatch = category.name.toLowerCase().contains(filter.toLowerCase());
                final descriptionMatch = category.description.toLowerCase().contains(filter.toLowerCase());
                return nameMatch || descriptionMatch;
              }))
        .toList();

    emit(state.copyWith(filteredCategories: filteredCategories));
  }

  Future<void> deleteCategory(String id) async {
    await (database.delete(database.itemCategoryTable)..where((tbl) => tbl.id.equals(id))).go();
    await load();
  }
}
