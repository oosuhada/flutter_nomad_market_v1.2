class Product {
  final String id;
  final String sellerId;
  final String name;
  final String description;
  final double price;
  final String currency;
  final String status;
  final bool isGroupPurchase;
  final String category;
  final double weight;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.status,
    required this.isGroupPurchase,
    required this.category,
    required this.weight,
    required this.createdAt,
  });

  Product copyWith({
    String? id,
    String? sellerId,
    String? name,
    String? description,
    double? price,
    String? currency,
    String? status,
    bool? isGroupPurchase,
    String? category,
    double? weight,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      sellerId: sellerId ?? this.sellerId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      isGroupPurchase: isGroupPurchase ?? this.isGroupPurchase,
      category: category ?? this.category,
      weight: weight ?? this.weight,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      sellerId: json['seller_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      currency: json['currency'],
      status: json['status'],
      isGroupPurchase: json['is_group_purchase'],
      category: json['category'],
      weight: json['weight'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'seller_id': sellerId,
      'name': name,
      'description': description,
      'price': price,
      'currency': currency,
      'status': status,
      'is_group_purchase': isGroupPurchase,
      'category': category,
      'weight': weight,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
