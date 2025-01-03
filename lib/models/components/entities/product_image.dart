class ProductImage {
  final String id;
  final String productId;
  final String imageUrl;
  final String orderIndex;
  final DateTime createdAt;

  ProductImage({
    required this.id,
    required this.productId,
    required this.imageUrl,
    required this.orderIndex,
    required this.createdAt,
  });

  ProductImage copyWith({
    String? id,
    String? productId,
    String? imageUrl,
    String? orderIndex,
    DateTime? createdAt,
  }) {
    return ProductImage(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      imageUrl: imageUrl ?? this.imageUrl,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      productId: json['product_id'],
      imageUrl: json['image_url'],
      orderIndex: json['order_index'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'image_url': imageUrl,
      'order_index': orderIndex,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
