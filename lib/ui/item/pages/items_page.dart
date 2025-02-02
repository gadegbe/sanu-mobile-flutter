import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/core/utils/crud_utils.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/cubit/item_state.dart';
import 'package:sanu/ui/item/widgets/item_update_widget.dart';

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
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<ItemCubit, ItemState>(
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
                  ...state.items.values.map(
                    (item) => TableRow(
                      children: [
                        Text(item.name),
                        Text(item.description),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Symbols.edit),
                              onPressed: () {
                                _updateItem(context, id: item.id);
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Symbols.delete),
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
}
