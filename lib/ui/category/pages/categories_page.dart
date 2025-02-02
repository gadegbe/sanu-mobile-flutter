import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/category/widgets/category_update_widget.dart';
import 'package:sanu/ui/core/utils/crud_utils.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                context.l10n.categoriesTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  _updateCategory(context);
                },
                icon: const Icon(Symbols.add),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return Table(
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text(
                        context.l10n.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        context.l10n.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        context.l10n.actions,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  ...state.categories.values.map(
                    (category) => TableRow(
                      children: [
                        Text(category.name),
                        Text(category.description),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Symbols.edit),
                              onPressed: () {
                                _updateCategory(context, id: category.id);
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Symbols.delete),
                              onPressed: () {
                                CRUDUtils.deleteConfirmation(
                                  context,
                                  onConfirm: () {
                                    context.read<CategoryCubit>().deleteCategory(category.id);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _updateCategory(BuildContext context, {String? id}) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: CategoryUpdateWidget(
            id: id,
            onSave: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }
}
