import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class DecimalKeyboard extends StatefulWidget {
  const DecimalKeyboard({super.key});

  @override
  State<DecimalKeyboard> createState() => _DecimalKeyboardState();
}

class _DecimalKeyboardState extends State<DecimalKeyboard> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          _buildNumberRow(context, values: ['1', '2', '3']),
          _buildNumberRow(context, values: ['4', '5', '6']),
          _buildNumberRow(context, values: ['7', '8', '9']),
          _buildNumberRow(context, values: ['.', '0', '⌫']),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Symbols.check,
              size: 56,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildNumberRow(BuildContext context, {required List<String> values}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((value) => _buildNumberButton(context, value: value)).toList(),
      ),
    );
  }

  Widget _buildNumberButton(BuildContext context, {required String value}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: (value != '.' || !this.value.contains('.'))
              ? () {
                  _tap(value);
                }
              : null,
          icon: Text(
            value,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }

  void _tap(String value) {
    if (value == '⌫') {
      if (this.value.isNotEmpty) {
        setState(() {
          this.value = this.value.substring(0, this.value.length - 1);
        });
      }
    } else {
      setState(() {
        this.value += value;
      });
    }
  }
}
