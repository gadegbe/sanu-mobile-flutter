import 'package:flutter/material.dart';
import 'package:sanu/ui/category/widgets/category_selector_widget.dart';

class CategoriesSelectorWidget extends StatelessWidget {
  const CategoriesSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: const CategorySelectorWidget(),
        );
      },
    );
  }
}
