import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/cubit/category_state.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/core/extensions/list_extension.dart';
import 'package:sanu/ui/item/cubit/item_cubit.dart';
import 'package:sanu/ui/item/models/item.dart';

class ItemUpdateWidget extends StatefulWidget {
  const ItemUpdateWidget({
    this.onSave,
    this.id,
    super.key,
  });

  final VoidCallback? onSave;
  final String? id;

  @override
  State<ItemUpdateWidget> createState() => _ItemUpdateWidgetState();
}

class _ItemUpdateWidgetState extends State<ItemUpdateWidget> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  ItemCategory? category;
  Item? item;

  @override
  void initState() {
    if (widget.id != null) {
      item = context.read<ItemCubit>().state.items[widget.id!];
      category = context.read<CategoryCubit>().state.categories[item?.categoryId];
      if (item != null) {
        _nameController.text = item!.name;
        _descriptionController.text = item!.description;
        _priceController.text = item!.price.toString();
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: context.l10n.name),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.noneEmptyField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: context.l10n.description),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.noneEmptyField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: context.l10n.price),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.noneEmptyField;
                  }
                  if (Decimal.tryParse(value) == null) {
                    return context.l10n.noneEmptyField;
                  }
                  return null;
                },
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return DropdownButtonFormField<ItemCategory>(
                    value: category,
                    decoration: InputDecoration(labelText: context.l10n.category),
                    items: state.categories.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return context.l10n.noneEmptyField;
                      }
                      return null;
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(context).validate()) {
                    final name = _nameController.text;
                    final description = _descriptionController.text;
                    if (category != null) {
                      context.read<ItemCubit>().upsertItem(
                            id: widget.id,
                            name: name,
                            description: description,
                            price: Decimal.parse(_priceController.text.replaceAll(',', '.')),
                            category: category!,
                          );
                    }

                    widget.onSave?.call();
                  }
                },
                child: Text(context.l10n.save),
              ),
            ].separated(separator: const SizedBox(height: 16)),
          );
        },
      ),
    );
  }
}
