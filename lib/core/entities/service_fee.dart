class ServiceFee {
  final String id;
  final String serviceType;
  final String region;
  final String feeType;
  final double feeAmount;
  final double minFee;
  final double maxFee;
  final String currency;
  final DateTime effectiveFrom;
  final DateTime effectiveTo;

  ServiceFee({
    required this.id,
    required this.serviceType,
    required this.region,
    required this.feeType,
    required this.feeAmount,
    required this.minFee,
    required this.maxFee,
    required this.currency,
    required this.effectiveFrom,
    required this.effectiveTo,
  });

  ServiceFee copyWith({
    String? id,
    String? serviceType,
    String? region,
    String? feeType,
    double? feeAmount,
    double? minFee,
    double? maxFee,
    String? currency,
    DateTime? effectiveFrom,
    DateTime? effectiveTo,
  }) {
    return ServiceFee(
      id: id ?? this.id,
      serviceType: serviceType ?? this.serviceType,
      region: region ?? this.region,
      feeType: feeType ?? this.feeType,
      feeAmount: feeAmount ?? this.feeAmount,
      minFee: minFee ?? this.minFee,
      maxFee: maxFee ?? this.maxFee,
      currency: currency ?? this.currency,
      effectiveFrom: effectiveFrom ?? this.effectiveFrom,
      effectiveTo: effectiveTo ?? this.effectiveTo,
    );
  }

  factory ServiceFee.fromJson(Map<String, dynamic> json) {
    return ServiceFee(
      id: json['id'],
      serviceType: json['service_type'],
      region: json['region'],
      feeType: json['fee_type'],
      feeAmount: json['fee_amount'],
      minFee: json['min_fee'],
      maxFee: json['max_fee'],
      currency: json['currency'],
      effectiveFrom: DateTime.parse(json['effective_from']),
      effectiveTo: DateTime.parse(json['effective_to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'service_type': serviceType,
      'region': region,
      'fee_type': feeType,
      'fee_amount': feeAmount,
      'min_fee': minFee,
      'max_fee': maxFee,
      'currency': currency,
      'effective_from': effectiveFrom.toIso8601String(),
      'effective_to': effectiveTo.toIso8601String(),
    };
  }
}
