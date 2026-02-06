class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel({
    required this.name,
    required this.real,
    required this.dolar,
    required this.euro,
    required this.bitcoin,
  });

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
        name: 'Real',
        real: 1.0,
        dolar: 0.19,
        euro: 0.16,
        bitcoin: 0.0000042,
      ),
      CurrencyModel(
        name: 'Dólar',
        real: 5.25,
        dolar: 1.0,
        euro: 0.85,
        bitcoin: 0.000022,
      ),
      CurrencyModel(
        name: 'Euro',
        real: 6.18,
        dolar: 1.18,
        euro: 1.0,
        bitcoin: 0.000026,
      ),
      CurrencyModel(
        name: 'Bitcoin',
        real: 240000.0,
        dolar: 45000.0,
        euro: 38000.0,
        bitcoin: 1.0,
      ),
    ];
  }
}
