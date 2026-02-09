import 'package:money_converter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeController Tests', () {
    late TextEditingController toTextController;
    late TextEditingController fromTextController;
    late HomeController homeController;

    setUp(() {
      toTextController = TextEditingController();
      fromTextController = TextEditingController();
      homeController = HomeController(
        toTextController: toTextController,
        fromTextController: fromTextController,
      );
    });

    tearDown(() {
      toTextController.dispose();
      fromTextController.dispose();
    });

    test('Deve inicializar com moedas corretas', () {
      expect(homeController.toCurrency.name, 'Real');
      expect(homeController.fromCurrency.name, 'Dólar');
      expect(homeController.currencies.length, greaterThan(3));
    });

    test('Deve validar entrada vazia', () async {
      toTextController.text = '';
      await homeController.convert();
      expect(homeController.errorMessage, 'Digite um valor para converter');
    });

    test('Deve validar entrada inválida', () async {
      toTextController.text = '0';
      await homeController.convert();
      expect(homeController.errorMessage, 'Digite um valor válido');
    });

    test('Deve trocar moedas corretamente', () {
      final toCurrencyOriginal = homeController.toCurrency;
      final fromCurrencyOriginal = homeController.fromCurrency;

      homeController.swapCurrencies();

      expect(homeController.toCurrency, fromCurrencyOriginal);
      expect(homeController.fromCurrency, toCurrencyOriginal);
      expect(toTextController.text, isEmpty);
      expect(fromTextController.text, isEmpty);
    });

    test('Deve configurar moedas específicas', () {
      final realCurrency = homeController.currencies.firstWhere(
        (currency) => currency.name == 'Real',
      );
      final dolarCurrency = homeController.currencies.firstWhere(
        (currency) => currency.name == 'Dólar',
      );

      homeController.toCurrency = realCurrency;
      homeController.fromCurrency = dolarCurrency;

      expect(homeController.toCurrency.code, 'BRL');
      expect(homeController.fromCurrency.code, 'USD');
    });
  });
}
