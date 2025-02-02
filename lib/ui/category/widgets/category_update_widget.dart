import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/l10n/l10n.dart';
import 'package:sanu/ui/category/cubit/category_cubit.dart';
import 'package:sanu/ui/category/models/item_category.dart';
import 'package:sanu/ui/core/extensions/list_extension.dart';

class CategoryUpdateWidget extends StatefulWidget {
  const CategoryUpdateWidget({
    this.onSave,
    this.id,
    super.key,
  });

  final VoidCallback? onSave;
  final String? id;

  @override
  State<CategoryUpdateWidget> createState() => _CategoryUpdateWidgetState();
}

class _CategoryUpdateWidgetState extends State<CategoryUpdateWidget> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  ItemCategory? category;

  @override
  void initState() {
    if (widget.id != null) {
      category = context.read<CategoryCubit>().state.categories[widget.id!];
      if (category != null) {
        _nameController.text = category!.name;
        _descriptionController.text = category!.description;
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
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
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.noneEmptyField;
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(context).validate()) {
                    final name = _nameController.text;
                    final description = _descriptionController.text;
                    context.read<CategoryCubit>().upsertCategory(
                          id: widget.id,
                          name: name,
                          description: description,
                        );

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
