import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:uuid/uuid.dart';

class CategoryCubit extends HydratedCubit<CategoryState> {
  CategoryCubit() : super(const CategoryState());

  ItemCategory? readCategory(String id) {
    return state.categories[id];
  }

  void upsertCategory({
    required String name,
    required String description,
    String? id,
    String? image,
  }) {
    final categoryId = id ?? const Uuid().v4();
    final createdAt = state.categories[categoryId]?.createdAt ?? DateTime.now();
    final category = ItemCategory(
      id: categoryId,
      name: name,
      description: description,
      image: image ?? 'https://placehold.co/400',
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
    final updatedCategories = Map<String, ItemCategory>.from(state.categories)..[category.id] = category;
    emit(state.copyWith(categories: updatedCategories));
  }

  void deleteCategory(String id) {
    final updatedCategories = Map<String, ItemCategory>.from(state.categories)..remove(id);
    emit(state.copyWith(categories: updatedCategories));
  }

  @override
  CategoryState? fromJson(Map<String, dynamic> json) => CategoryState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CategoryState state) => state.toJson();
}
