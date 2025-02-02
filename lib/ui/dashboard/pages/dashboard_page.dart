import 'package:flutter/material.dart';
import 'package:sanu/ui/cart/widgets/cart_widget.dart';
import 'package:sanu/ui/category/widgets/categories_selector_widget.dart';
import 'package:sanu/ui/item/widgets/items_selector_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: const CategoriesSelectorWidget(),
              ),
              const Divider(indent: 8),
              const Expanded(child: ItemsSelectorWidget()),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: const CartWidget(),
        ),
      ],
    );
  }
}
