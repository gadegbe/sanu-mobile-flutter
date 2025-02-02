import 'package:flutter/material.dart';
import 'package:sanu/ui/item/widgets/item_selector_widget.dart';

class ItemsSelectorWidget extends StatelessWidget {
  const ItemsSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return const Card(
          child: ItemSelectorWidget(),
        );
      },
    );
  }
}
