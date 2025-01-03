class DeliveryOfferDTO {
  final String id;
  final String requestId;
  final String travelerId;
  final double price;
  final String currency;
  final double commissionFee;
  final DateTime estimatedDeliveryDate;
  final String? note;
  final String status;

  DeliveryOfferDTO({
    required this.id,
    required this.requestId,
    required this.travelerId,
    required this.price,
    required this.currency,
    required this.commissionFee,
    required this.estimatedDeliveryDate,
    this.note,
    required this.status,
  });

  factory DeliveryOfferDTO.fromJson(Map<String, dynamic> json) {
    return DeliveryOfferDTO(
      id: json['id'],
      requestId: json['request_id'],
      travelerId: json['traveler_id'],
      price: json['price'],
      currency: json['currency'],
      commissionFee: json['commission_fee'],
      estimatedDeliveryDate: DateTime.parse(json['estimated_delivery_date']),
      note: json['note'],
      status: json['status'],
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
    };
  }
}
