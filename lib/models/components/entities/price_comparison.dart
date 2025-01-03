class PriceComparison {
  final String id;
  final String productId;
  final String platform;
  final double price;
  final String currency;
  final String url;
  final DateTime createdAt;

  PriceComparison({
    required this.id,
    required this.productId,
    required this.platform,
    required this.price,
    required this.currency,
    required this.url,
    required this.createdAt,
  });

  PriceComparison copyWith({
    String? id,
    String? productId,
    String? platform,
    double? price,
    String? currency,
    String? url,
    DateTime? createdAt,
  }) {
    return PriceComparison(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      platform: platform ?? this.platform,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory PriceComparison.fromJson(Map<String, dynamic> json) {
    return PriceComparison(
      id: json['id'],
      productId: json['product_id'],
      platform: json['platform'],
      price: json['price'],
      currency: json['currency'],
      url: json['url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'platform': platform,
      'price': price,
      'currency': currency,
      'url': url,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
