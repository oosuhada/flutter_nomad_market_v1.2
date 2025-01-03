class DeliveryOffer {
  final String id;
  final String requestId;
  final String travelerId;
  final double price;
  final String currency;
  final double commissionFee;
  final DateTime estimatedDeliveryDate;
  final String? note;
  final String status;
  final DateTime createdAt;

  DeliveryOffer({
    required this.id,
    required this.requestId,
    required this.travelerId,
    required this.price,
    required this.currency,
    required this.commissionFee,
    required this.estimatedDeliveryDate,
    this.note,
    required this.status,
    required this.createdAt,
  });

  DeliveryOffer copyWith({
    String? id,
    String? requestId,
    String? travelerId,
    double? price,
    String? currency,
    double? commissionFee,
    DateTime? estimatedDeliveryDate,
    String? note,
    String? status,
    DateTime? createdAt,
  }) {
    return DeliveryOffer(
      id: id ?? this.id,
      requestId: requestId ?? this.requestId,
      travelerId: travelerId ?? this.travelerId,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      commissionFee: commissionFee ?? this.commissionFee,
      estimatedDeliveryDate:
          estimatedDeliveryDate ?? this.estimatedDeliveryDate,
      note: note ?? this.note,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory DeliveryOffer.fromJson(Map<String, dynamic> json) {
    return DeliveryOffer(
      id: json['id'],
      requestId: json['request_id'],
      travelerId: json['traveler_id'],
      price: json['price'],
      currency: json['currency'],
      commissionFee: json['commission_fee'],
      estimatedDeliveryDate: DateTime.parse(json['estimated_delivery_date']),
      note: json['note'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'request_id': requestId,
      'traveler_id': travelerId,
      'price': price,
      'currency': currency,
      'commission_fee': commissionFee,
      'estimated_delivery_date': estimatedDeliveryDate.toIso8601String(),
      'note': note,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
