import 'package:currency_converter/currency_converter.dart';
import 'package:currency_converter/currency.dart';

class CurrencyConverterService {
  /// Converte um valor de uma moeda para outra
  /// [fromCurrency] - Código da moeda origem (ex: 'USD', 'BRL', 'EUR')
  /// [toCurrency] - Código da moeda destino (ex: 'USD', 'BRL', 'EUR')
  /// [amount] - Valor a ser convertido
  static Future<double?> convertCurrency({
    required String fromCurrency,
    required String toCurrency,
    required double amount,
  }) async {
    try {
      // Mapeia nomes em português para códigos das moedas
      final fromCode = _getCurrencyCode(fromCurrency);
      final toCode = _getCurrencyCode(toCurrency);

      if (fromCode == null || toCode == null) {
        print('Código de moeda não encontrado');
        return null;
      }

      // Faz a conversão usando o pacote currency_converter
      final convertedAmount = await CurrencyConverter.convert(
        from: fromCode,
        to: toCode,
        amount: amount,
      );

      return convertedAmount;
    } catch (e) {
      print('Erro na conversão: $e');
      return null;
    }
  }

  /// Mapeia nomes em português para códigos ISO de moedas
  static Currency? _getCurrencyCode(String currencyName) {
    switch (currencyName.toLowerCase()) {
      case 'real':
        return Currency.brl;
      case 'dólar':
      case 'dolar':
        return Currency.usd;
      case 'euro':
        return Currency.eur;
      case 'bitcoin':
        return Currency.btc;
      case 'libra':
        return Currency.gbp;
      case 'iene':
        return Currency.jpy;
      default:
        return null;
    }
  }

  /// Obtém a taxa de câmbio atual entre duas moedas
  static Future<double?> getExchangeRate({
    required String fromCurrency,
    required String toCurrency,
  }) async {
    try {
      final result = await convertCurrency(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
        amount: 1.0,
      );
      return result;
    } catch (e) {
      print('Erro ao obter taxa de câmbio: $e');
      return null;
    }
  }
}
