import 'package:decimal/decimal.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/item/models/item.dart';
import 'package:uuid/uuid.dart';

class ItemCubit extends HydratedCubit<ItemState> {
  ItemCubit() : super(const ItemState());

  void upsertItem({
    required String name,
    required String description,
    required ItemCategory category,
    required Decimal price,
    String? image,
    String? id,
  }) {
    final itemId = id ?? const Uuid().v4();
    final createdAt = state.items[itemId]?.createdAt ?? DateTime.now();
    final item = Item(
      id: itemId,
      name: name,
      description: description,
      price: price,
      categoryId: category.id,
      image: image ?? 'https://placehold.co/400',
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
    final updatedItems = Map<String, Item>.from(state.items)..[item.id] = item;
    emit(state.copyWith(items: updatedItems));
  }

  void deleteItem(String itemId) {
    final updatedItems = Map<String, Item>.from(state.items)..remove(itemId);
    emit(state.copyWith(items: updatedItems));
  }

  Item? getItem(String itemId) {
    return state.items[itemId];
  }

  @override
  ItemState fromJson(Map<String, dynamic> json) {
    return ItemState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ItemState state) {
    return state.toJson();
  }
}
