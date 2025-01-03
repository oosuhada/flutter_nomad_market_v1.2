class Payment {
  final String id;
  final String transactionId;
  final String paymentMethod;
  final double amount;
  final String currency;
  final String status;
  final DateTime paymentDate;

  Payment({
    required this.id,
    required this.transactionId,
    required this.paymentMethod,
    required this.amount,
    required this.currency,
    required this.status,
    required this.paymentDate,
  });

  Payment copyWith({
    String? id,
    String? transactionId,
    String? paymentMethod,
    double? amount,
    String? currency,
    String? status,
    DateTime? paymentDate,
  }) {
    return Payment(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      paymentDate: paymentDate ?? this.paymentDate,
    );
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      transactionId: json['transaction_id'],
      paymentMethod: json['payment_method'],
      amount: json['amount'],
      currency: json['currency'],
      status: json['status'],
      paymentDate: DateTime.parse(json['payment_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaction_id': transactionId,
      'payment_method': paymentMethod,
      'amount': amount,
      'currency': currency,
      'status': status,
      'payment_date': paymentDate.toIso8601String(),
    };
  }
}
