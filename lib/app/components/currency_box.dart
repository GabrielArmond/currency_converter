import 'package:money_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedItem;
  final void Function(CurrencyModel model) onChanged;
  final bool isReadOnly;

  const CurrencyBox({
    super.key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
    this.isReadOnly = false,
  });

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
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text('${item.name} (${item.code})'),
                    ),
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
        SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 56,
            child: TextField(
              controller: controller,
              readOnly: isReadOnly,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                prefixText: '${selectedItem.symbol} ',
                prefixStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                border: const UnderlineInputBorder(),
                hintText: '0.00',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
