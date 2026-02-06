import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toTextController = TextEditingController();
  final TextEditingController fromTextController = TextEditingController();

  final homeController = HomeController(
    toTextController: toTextController,
    fromTextController: fromTextController,
  );

  test('Deve converter de Real para Dólar com vírgula', () {
    toTextController.text = '2,0';

    homeController.convert();

    expect(fromTextController.text, '0.38');
  });

  test('Deve converter de Real para Dólar com ponto', () {
    toTextController.text = '2.0';

    homeController.convert();

    expect(fromTextController.text, '0.38');
  });

  test('Deve converter de Dólar para Real', () {
    toTextController.text = '1.0';

    homeController.toCurrency = CurrencyModel(
      name: 'Dólar',
      real: 5.25,
      dolar: 1.0,
      euro: 0.85,
      bitcoin: 0.000022,
    );
    homeController.fromCurrency = CurrencyModel(
      name: 'Real',
      real: 1.0,
      dolar: 0.19,
      euro: 0.16,
      bitcoin: 0.0000042,
    );

    homeController.convert();

    expect(
      fromTextController.text,
      homeController.toCurrency.real.toStringAsFixed(2),
    );
  });
}
