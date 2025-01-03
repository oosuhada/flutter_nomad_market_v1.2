class ExchangeRate {
  final String id;
  final String fromCurrency;
  final String toCurrency;
  final double rate;
  final DateTime updatedAt;

  ExchangeRate({
    required this.id,
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
    required this.updatedAt,
  });

  ExchangeRate copyWith({
    String? id,
    String? fromCurrency,
    String? toCurrency,
    double? rate,
    DateTime? updatedAt,
  }) {
    return ExchangeRate(
      id: id ?? this.id,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      rate: rate ?? this.rate,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      id: json['id'],
      fromCurrency: json['from_currency'],
      toCurrency: json['to_currency'],
      rate: json['rate'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'from_currency': fromCurrency,
      'to_currency': toCurrency,
      'rate': rate,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
