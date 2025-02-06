import 'package:flutter/material.dart';
import 'package:sanu/ui/cart/widgets/cart_widget.dart';
import 'package:sanu/ui/cart/widgets/transaction_type_switcher_widget.dart';
import 'package:sanu/ui/category/widgets/categories_selector_widget.dart';
import 'package:sanu/ui/core/extensions/context_layout_extension.dart';
import 'package:sanu/ui/item/widgets/items_selector_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static String name = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
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
}
