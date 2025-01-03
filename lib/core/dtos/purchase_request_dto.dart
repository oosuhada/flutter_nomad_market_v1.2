class PurchaseRequestDTO {
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

  PurchaseRequestDTO({
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
  });

  factory PurchaseRequestDTO.fromJson(Map<String, dynamic> json) {
    return PurchaseRequestDTO(
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
    };
  }
}
