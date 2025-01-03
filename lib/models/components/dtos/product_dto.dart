class ProductDTO {
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

  ProductDTO({
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
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
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
    };
  }
}
