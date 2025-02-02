import 'package:flutter/material.dart';

class CategorySelectorWidget extends StatelessWidget {
  const CategorySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.category),
            const Spacer(),
            Text('Category', style: Theme.of(context).textTheme.titleMedium),
            Text('[N] Items', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
