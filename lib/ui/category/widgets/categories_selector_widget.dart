import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/category/widgets/category_selector_widget.dart';

class CategoriesSelectorWidget extends StatelessWidget {
  const CategoriesSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TransactionCubit, TransactionState, ItemCategory?>(
      selector: (state) => state.selectedCategory,
      builder: (context, selectedCategory) {
        return BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.filteredCategories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              itemBuilder: (context, index) {
                final category = state.filteredCategories.elementAt(index);
                return InkWell(
                  onTap: () {
                    context.read<TransactionCubit>().selectCategory(selectedCategory != category ? category : null);
                  },
                  child: CategorySelectorWidget(category: category),
                );
              },
            );
          },
        );
      },
    );
  }
}
