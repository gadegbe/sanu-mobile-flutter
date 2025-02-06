import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/category/utils/categories_utils.dart';

class CategorySelectorWidget extends StatelessWidget {
  const CategorySelectorWidget({
    required this.category,
    super.key,
  });

  final ItemCategory category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        final items = CategoriesUtils.numberOfItems(context, categoryId: category.id);
        final isSelected = state.selectedCategory?.id == category.id;
        return Card(
          color: isSelected ? Theme.of(context).colorScheme.secondaryContainer : null,
          child: Container(
            width: 160,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.category,
                  color: isSelected ? Theme.of(context).colorScheme.onSecondaryContainer : null,
                ),
                const Spacer(),
                Text(
                  category.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: isSelected ? Theme.of(context).colorScheme.onSecondaryContainer : null),
                ),
                Text(
                  context.l10n.numberOfItems(items),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: isSelected ? Theme.of(context).colorScheme.onSecondaryContainer : null),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
