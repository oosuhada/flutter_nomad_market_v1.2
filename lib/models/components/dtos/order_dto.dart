class OrderDTO {
  final String id;
  final String buyerId;
  final String sellerId;
  final String deliveryAddressId;
  final double totalAmount;
  final String currency;
  final String status;

  OrderDTO({
    required this.id,
    required this.buyerId,
    required this.sellerId,
    required this.deliveryAddressId,
    required this.totalAmount,
    required this.currency,
    required this.status,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      id: json['id'],
      buyerId: json['buyer_id'],
      sellerId: json['seller_id'],
      deliveryAddressId: json['delivery_address_id'],
      totalAmount: json['total_amount'],
      currency: json['currency'],
      status: json['status'],
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
    };
  }
}
