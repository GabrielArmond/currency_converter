import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toTextController;
  final TextEditingController fromTextController;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({
    required this.toTextController,
    required this.fromTextController,
  }) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toTextController.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0.0;

    switch (fromCurrency.name) {
      case 'Real':
        returnValue = (value * toCurrency.real);
        break;
      case 'Dólar':
        returnValue = (value * toCurrency.dolar);
        break;
      case 'Euro':
        returnValue = (value * toCurrency.euro);
        break;
      case 'Bitcoin':
        returnValue = (value * toCurrency.bitcoin);
        break;
    }

    fromTextController.text = returnValue.toStringAsFixed(2);
  }
}
