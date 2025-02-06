import 'package:flutter/foundation.dart';
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

  static String name = 'categories';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  context.l10n.categoriesTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    _updateCategory(context);
                  },
                  icon: const Icon(Symbols.add),
                ),
                const Spacer(),
                if (kDebugMode) ...[
                  IconButton(
                    onPressed: () {
                      context.read<CategoryCubit>().dropItemCategoryTable();
                    },
                    icon: const Icon(Symbols.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CategoryCubit>().mock();
                    },
                    icon: const Icon(Symbols.upload),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                return Table(
                  border: TableBorder.all(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(50),
                  ),
                  columnWidths: const {
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                    2: IntrinsicColumnWidth(),
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
                      ].map((e) => Padding(padding: const EdgeInsets.all(8), child: e)).toList(),
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
                        ]
                            .map(
                              (e) => TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: e,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
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
