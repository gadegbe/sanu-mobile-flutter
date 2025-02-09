import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/core/extensions/context_extension.dart';
import 'package:sanu/ui/core/extensions/context_layout_extension.dart';
import 'package:sanu/ui/core/extensions/decimal_extension.dart';
import 'package:sanu/ui/core/utils/crud_utils.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/item/pages/item_details.dart';
import 'package:sanu/ui/item/widgets/item_update_widget.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  static String name = 'items';

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
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
                  context.l10n.itemsTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    _updateItem(context);
                  },
                  icon: const Icon(Symbols.add),
                ),
                const Spacer(),
                if (kDebugMode) ...[
                  IconButton(
                    onPressed: () {
                      context.read<ItemCubit>().dropItemTable();
                    },
                    icon: const Icon(Symbols.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ItemCubit>().mock();
                    },
                    icon: const Icon(Symbols.upload),
                  ),
                  IconButton(
                    onPressed: () => _download(context),
                    icon: const Icon(
                      Symbols.download,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<StockCubit, StockState>(
              builder: (context, stockState) {
                return BlocBuilder<ItemCubit, ItemState>(
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
                              3: IntrinsicColumnWidth(),
                              4: IntrinsicColumnWidth(),
                              5: IntrinsicColumnWidth(),
                            }
                          : const {
                              0: FlexColumnWidth(),
                              1: IntrinsicColumnWidth(),
                              2: IntrinsicColumnWidth(),
                            },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              context.l10n.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            if (context.showFullTable) ...[
                              Text(
                                context.l10n.description,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                context.l10n.category,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                context.l10n.price,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                            Text(
                              context.l10n.stocksTitle,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              context.l10n.actions,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ].map((e) => Padding(padding: const EdgeInsets.all(8), child: e)).toList(),
                        ),
                        ...state.filteredItems.map((item) {
                          final category = context.read<CategoryCubit>().state.categories[item.categoryId];
                          return TableRow(
                            children: [
                              Text(
                                item.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (context.showFullTable) ...[
                                Text(item.description),
                                Text(category?.name ?? ''),
                                Text(
                                  item.price.toCurrencyFormat(context),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                              Text(
                                stockState.stocks[item.id]?.quantity.toString() ?? '0',
                                textAlign: TextAlign.right,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.goNamed(
                                        ItemDetails.name,
                                        queryParameters: {'id': item.id},
                                      );
                                    },
                                    color: context.colorScheme.primary,
                                    icon: const Icon(
                                      Symbols.file_open,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Symbols.edit),
                                    color: context.colorScheme.secondary,
                                    onPressed: () {
                                      _updateItem(context, id: item.id);
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    icon: const Icon(Symbols.delete),
                                    color: context.colorScheme.error,
                                    onPressed: () {
                                      CRUDUtils.deleteConfirmation(
                                        context,
                                        onConfirm: () {
                                          context.read<ItemCubit>().deleteItem(item.id);
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
                          );
                        }),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateItem(BuildContext context, {String? id}) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ItemUpdateWidget(
            id: id,
            onSave: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  Future<void> _download(BuildContext context) async {
    final csv = const ListToCsvConverter().convert(
      [
        ['Column1', 'Column2'],
        ['Column1', 'Column2'],
        ['Column1', 'Column2'],
      ],
    );
    final bytes = Uint8List.fromList(utf8.encode(csv));

    await FileSaver.instance.saveFile(
      name: 'stock-${DateTime.now()}',
      bytes: bytes,
      ext: 'csv',
      mimeType: MimeType.csv,
    );
  }

  void _filter(BuildContext context) {
    final query = searchController.text.toLowerCase();
    context.read<ItemCubit>().filterItems(filter: query);
  }
}
