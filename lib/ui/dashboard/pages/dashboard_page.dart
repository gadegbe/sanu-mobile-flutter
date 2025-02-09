import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sanu/ui/cart/cubit/transaction_cubit.dart';
import 'package:sanu/ui/cart/widgets/cart_widget.dart';
import 'package:sanu/ui/cart/widgets/transaction_type_switcher_widget.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/widgets/categories_selector_widget.dart';
import 'package:sanu/ui/core/extensions/context_layout_extension.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/widgets/items_selector_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static String name = 'dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(() => _filter(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Symbols.search),
                      suffixIcon: GestureDetector(
                        onTap: searchController.clear,
                        child: const Icon(Symbols.clear),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: const CategoriesSelectorWidget(),
                ),
                const Divider(indent: 8),
                if (!context.showCartWidget) const TransactionTypeSwitcherWidget(),
                const Expanded(child: ItemsSelectorWidget()),
              ],
            ),
          ),
          if (context.showCartWidget)
            Container(
              width: 300,
              padding: const EdgeInsets.only(right: 16, bottom: 16),
              child: const CartWidget(),
            ),
        ],
      ),
    );
  }

  void _filter(BuildContext context) {
    final query = searchController.text.toLowerCase();
    context.read<TransactionCubit>().selectCategory(null);
    context.read<CategoryCubit>().filterCategories(filter: query);
    context.read<ItemCubit>().filterItems(filter: query);
  }
}
