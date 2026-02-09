import 'package:money_converter/app/models/currency_model.dart';
import 'package:money_converter/app/api/currency_converter.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toTextController;
  final TextEditingController fromTextController;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;
  bool isLoading = false;
  String? errorMessage;

  HomeController({
    required this.toTextController,
    required this.fromTextController,
  }) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  Future<void> convert() async {
    String text = toTextController.text.trim();
    if (text.isEmpty) {
      errorMessage = 'Digite um valor para converter';
      return;
    }

    double value = double.tryParse(text.replaceAll(',', '.')) ?? 0.0;
    if (value <= 0) {
      errorMessage = 'Digite um valor válido';
      return;
    }

    isLoading = true;
    errorMessage = null;

    try {
      final convertedValue = await CurrencyConverterService.convertCurrency(
        fromCurrency: fromCurrency.name,
        toCurrency: toCurrency.name,
        amount: value,
      );

      if (convertedValue != null) {
        fromTextController.text = convertedValue.toStringAsFixed(2);
        errorMessage = null;
      } else {
        errorMessage = 'Erro na conversão. Tente novamente.';
        fromTextController.text = '';
      }
    } catch (e) {
      errorMessage = 'Erro de conexão. Verifique sua internet.';
      fromTextController.text = '';
    } finally {
      isLoading = false;
    }
  }

  void swapCurrencies() {
    final temp = toCurrency;
    toCurrency = fromCurrency;
    fromCurrency = temp;

    toTextController.clear();
    fromTextController.clear();
  }
}
