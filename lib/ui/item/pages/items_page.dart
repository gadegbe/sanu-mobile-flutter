import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/core/extensions/context_extension.dart';
import 'package:sanu/ui/core/extensions/decimal_extension.dart';
import 'package:sanu/ui/core/utils/crud_utils.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/item/widgets/item_update_widget.dart';
import 'package:sanu/ui/stock/cubit/stock_cubit.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

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
              IconButton(
                onPressed: () => _download(context),
                icon: const Icon(
                  Symbols.download,
                ),
              ),
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
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                      2: IntrinsicColumnWidth(),
                      3: IntrinsicColumnWidth(),
                      4: IntrinsicColumnWidth(),
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
                            context.l10n.price,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
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
                      ...state.items.values.map(
                        (item) => TableRow(
                          children: [
                            Text(item.name),
                            Text(item.description),
                            Text(
                              item.price.toCurrencyFormat(context),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              stockState.stocks[item.id]?.quantity.toString() ?? '0',
                              textAlign: TextAlign.right,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
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
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
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
}
