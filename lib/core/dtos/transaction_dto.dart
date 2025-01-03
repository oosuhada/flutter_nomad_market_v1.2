class TransactionDTO {
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

  TransactionDTO({
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
  });

  factory TransactionDTO.fromJson(Map<String, dynamic> json) {
    return TransactionDTO(
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
    };
  }
}
