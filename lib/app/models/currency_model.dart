class CurrencyModel {
  final String name;
  final String code;
  final String symbol;

  CurrencyModel({required this.name, required this.code, required this.symbol});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(name: 'Real', code: 'BRL', symbol: 'R\$'),
      CurrencyModel(name: 'Dólar', code: 'USD', symbol: '\$'),
      CurrencyModel(name: 'Euro', code: 'EUR', symbol: '€'),
      CurrencyModel(name: 'Bitcoin', code: 'BTC', symbol: '₿'),
      CurrencyModel(name: 'Libra', code: 'GBP', symbol: '£'),
      CurrencyModel(name: 'Iene', code: 'JPY', symbol: '¥'),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CurrencyModel && other.name == name && other.code == code;
  }

  @override
  int get hashCode => name.hashCode ^ code.hashCode;

  @override
  String toString() =>
      'CurrencyModel(name: $name, code: $code, symbol: $symbol)';
}
