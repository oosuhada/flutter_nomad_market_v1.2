class Transaction {
  final String id;
  final String orderId;
  final String purchaseRequestId;
  final String buyerId;
  final String sellerId;
  final String transactionType;
  final String paymentStatus;
  final String escrowStatus;
  final double totalAmount;
  final double commissionAmount;
  final String currency;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.orderId,
    required this.purchaseRequestId,
    required this.buyerId,
    required this.sellerId,
    required this.transactionType,
    required this.paymentStatus,
    required this.escrowStatus,
    required this.totalAmount,
    required this.commissionAmount,
    required this.currency,
    required this.createdAt,
  });

  Transaction copyWith({
    String? id,
    String? orderId,
    String? purchaseRequestId,
    String? buyerId,
    String? sellerId,
    String? transactionType,
    String? paymentStatus,
    String? escrowStatus,
    double? totalAmount,
    double? commissionAmount,
    String? currency,
    DateTime? createdAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      purchaseRequestId: purchaseRequestId ?? this.purchaseRequestId,
      buyerId: buyerId ?? this.buyerId,
      sellerId: sellerId ?? this.sellerId,
      transactionType: transactionType ?? this.transactionType,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      escrowStatus: escrowStatus ?? this.escrowStatus,
      totalAmount: totalAmount ?? this.totalAmount,
      commissionAmount: commissionAmount ?? this.commissionAmount,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      orderId: json['order_id'],
      purchaseRequestId: json['purchase_request_id'],
      buyerId: json['buyer_id'],
      sellerId: json['seller_id'],
      transactionType: json['transaction_type'],
      paymentStatus: json['payment_status'],
      escrowStatus: json['escrow_status'],
      totalAmount: json['total_amount'],
      commissionAmount: json['commission_amount'],
      currency: json['currency'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'purchase_request_id': purchaseRequestId,
      'buyer_id': buyerId,
      'seller_id': sellerId,
      'transaction_type': transactionType,
      'payment_status': paymentStatus,
      'escrow_status': escrowStatus,
      'total_amount': totalAmount,
      'commission_amount': commissionAmount,
      'currency': currency,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
