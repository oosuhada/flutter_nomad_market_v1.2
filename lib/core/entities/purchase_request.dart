class PurchaseRequest {
  final String id;
  final String buyerId;
  final String title;
  final String description;
  final String? targetItemUrl;
  final double desiredPriceRangeMin;
  final double desiredPriceRangeMax;
  final String currency;
  final String urgencyLevel;
  final String serviceType;
  final String targetLocation;
  final DateTime desiredDeliveryDate;
  final String status;
  final DateTime createdAt;

  PurchaseRequest({
    required this.id,
    required this.buyerId,
    required this.title,
    required this.description,
    this.targetItemUrl,
    required this.desiredPriceRangeMin,
    required this.desiredPriceRangeMax,
    required this.currency,
    required this.urgencyLevel,
    required this.serviceType,
    required this.targetLocation,
    required this.desiredDeliveryDate,
    required this.status,
    required this.createdAt,
  });

  PurchaseRequest copyWith({
    String? id,
    String? buyerId,
    String? title,
    String? description,
    String? targetItemUrl,
    double? desiredPriceRangeMin,
    double? desiredPriceRangeMax,
    String? currency,
    String? urgencyLevel,
    String? serviceType,
    String? targetLocation,
    DateTime? desiredDeliveryDate,
    String? status,
    DateTime? createdAt,
  }) {
    return PurchaseRequest(
      id: id ?? this.id,
      buyerId: buyerId ?? this.buyerId,
      title: title ?? this.title,
      description: description ?? this.description,
      targetItemUrl: targetItemUrl ?? this.targetItemUrl,
      desiredPriceRangeMin: desiredPriceRangeMin ?? this.desiredPriceRangeMin,
      desiredPriceRangeMax: desiredPriceRangeMax ?? this.desiredPriceRangeMax,
      currency: currency ?? this.currency,
      urgencyLevel: urgencyLevel ?? this.urgencyLevel,
      serviceType: serviceType ?? this.serviceType,
      targetLocation: targetLocation ?? this.targetLocation,
      desiredDeliveryDate: desiredDeliveryDate ?? this.desiredDeliveryDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory PurchaseRequest.fromJson(Map<String, dynamic> json) {
    return PurchaseRequest(
      id: json['id'],
      buyerId: json['buyer_id'],
      title: json['title'],
      description: json['description'],
      targetItemUrl: json['target_item_url'],
      desiredPriceRangeMin: json['desired_price_range_min'],
      desiredPriceRangeMax: json['desired_price_range_max'],
      currency: json['currency'],
      urgencyLevel: json['urgency_level'],
      serviceType: json['service_type'],
      targetLocation: json['target_location'],
      desiredDeliveryDate: DateTime.parse(json['desired_delivery_date']),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buyer_id': buyerId,
      'title': title,
      'description': description,
      'target_item_url': targetItemUrl,
      'desired_price_range_min': desiredPriceRangeMin,
      'desired_price_range_max': desiredPriceRangeMax,
      'currency': currency,
      'urgency_level': urgencyLevel,
      'service_type': serviceType,
      'target_location': targetLocation,
      'desired_delivery_date': desiredDeliveryDate.toIso8601String(),
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
