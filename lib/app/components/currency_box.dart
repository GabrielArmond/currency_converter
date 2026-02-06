import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedItem;
  final void Function(CurrencyModel model) onChanged;

  const CurrencyBox({
    super.key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
  });

  static String prefixText(String name) {
    switch (name) {
      case 'Real':
        return 'R\$ ';
      case 'Dólar':
        return '\$ ';
      case 'Euro':
        return '€ ';
      case 'Bitcoin':
        return 'BTC ';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              isExpanded: true,
              mouseCursor: SystemMouseCursors.click,
              underline: Container(height: 1, color: Colors.grey),
              value: selectedItem,
              items: items
                  .map(
                    (item) =>
                        DropdownMenuItem(value: item, child: Text(item.name)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            scrollPadding: EdgeInsets.all(10),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: 'Valor',
              prefixText: prefixText(selectedItem.name),
            ),
          ),
        ),
      ],
    );
  }
}
