class Order {
  final String id;
  final String buyerId;
  final String sellerId;
  final String deliveryAddressId;
  final double totalAmount;
  final String currency;
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.buyerId,
    required this.sellerId,
    required this.deliveryAddressId,
    required this.totalAmount,
    required this.currency,
    required this.status,
    required this.createdAt,
  });

  Order copyWith({
    String? id,
    String? buyerId,
    String? sellerId,
    String? deliveryAddressId,
    double? totalAmount,
    String? currency,
    String? status,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      buyerId: buyerId ?? this.buyerId,
      sellerId: sellerId ?? this.sellerId,
      deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
      totalAmount: totalAmount ?? this.totalAmount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      buyerId: json['buyer_id'],
      sellerId: json['seller_id'],
      deliveryAddressId: json['delivery_address_id'],
      totalAmount: json['total_amount'],
      currency: json['currency'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buyer_id': buyerId,
      'seller_id': sellerId,
      'delivery_address_id': deliveryAddressId,
      'total_amount': totalAmount,
      'currency': currency,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
