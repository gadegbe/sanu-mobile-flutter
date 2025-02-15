import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/category/widgets/category_update_widget.dart';
import 'package:sanu/ui/core/const.dart';
import 'package:sanu/ui/core/extensions/context_layout_extension.dart';
import 'package:sanu/ui/core/utils/crud_utils.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  static String name = 'categories';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(() => _filter(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
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
            const SizedBox(height: 16),
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
                if (AppConfig.isDebugModeActive) ...[
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
                  columnWidths: context.showFullTable
                      ? const {
                          0: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(),
                          2: IntrinsicColumnWidth(),
                        }
                      : const {
                          0: FlexColumnWidth(),
                          1: IntrinsicColumnWidth(),
                        },
                  children: [
                    TableRow(
                      children: [
                        Text(
                          context.l10n.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (context.showFullTable)
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
                    ...state.filteredCategories.map(
                      (category) => TableRow(
                        children: [
                          Text(
                            category.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (context.showFullTable) Text(category.description),
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

  void _filter(BuildContext context) {
    final query = searchController.text.toLowerCase();
    context.read<CategoryCubit>().filterCategories(filter: query);
  }
}
