class DeliveryAddress {
  final String id;
  final String userId;
  final String name;
  final String phone;
  final String country;
  final String state;
  final String city;
  final String streetAddress;
  final String postalCode;
  final bool isDefault;
  final DateTime createdAt;

  DeliveryAddress({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.country,
    required this.state,
    required this.city,
    required this.streetAddress,
    required this.postalCode,
    required this.isDefault,
    required this.createdAt,
  });

  DeliveryAddress copyWith({
    String? id,
    String? userId,
    String? name,
    String? phone,
    String? country,
    String? state,
    String? city,
    String? streetAddress,
    String? postalCode,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return DeliveryAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      streetAddress: streetAddress ?? this.streetAddress,
      postalCode: postalCode ?? this.postalCode,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) {
    return DeliveryAddress(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      phone: json['phone'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      streetAddress: json['street_address'],
      postalCode: json['postal_code'],
      isDefault: json['is_default'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'phone': phone,
      'country': country,
      'state': state,
      'city': city,
      'street_address': streetAddress,
      'postal_code': postalCode,
      'is_default': isDefault,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
