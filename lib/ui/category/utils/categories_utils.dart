import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';

abstract class CategoriesUtils {
  static int numberOfItems(BuildContext context, {required String categoryId}) {
    final items = context.read<ItemCubit>().state.items.values.where((item) => item.categoryId == categoryId);
    return items.length;
  }
}
