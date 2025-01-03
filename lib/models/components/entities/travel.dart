class Travel {
  final String id;
  final String userId;
  final String departureLocation;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final String status;
  final double availableWeight;
  final String preferredCategories;
  final bool purchaseAvailable;
  final bool deliveryOnlyAvailable;
  final String transportationType;
  final Map<String, dynamic> routeStops;
  final DateTime createdAt;

  Travel({
    required this.id,
    required this.userId,
    required this.departureLocation,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.status,
    required this.availableWeight,
    required this.preferredCategories,
    required this.purchaseAvailable,
    required this.deliveryOnlyAvailable,
    required this.transportationType,
    required this.routeStops,
    required this.createdAt,
  });

  Travel copyWith({
    String? id,
    String? userId,
    String? departureLocation,
    String? destination,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    String? status,
    double? availableWeight,
    String? preferredCategories,
    bool? purchaseAvailable,
    bool? deliveryOnlyAvailable,
    String? transportationType,
    Map<String, dynamic>? routeStops,
    DateTime? createdAt,
  }) {
    return Travel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      departureLocation: departureLocation ?? this.departureLocation,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      status: status ?? this.status,
      availableWeight: availableWeight ?? this.availableWeight,
      preferredCategories: preferredCategories ?? this.preferredCategories,
      purchaseAvailable: purchaseAvailable ?? this.purchaseAvailable,
      deliveryOnlyAvailable:
          deliveryOnlyAvailable ?? this.deliveryOnlyAvailable,
      transportationType: transportationType ?? this.transportationType,
      routeStops: routeStops ?? this.routeStops,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Travel.fromJson(Map<String, dynamic> json) {
    return Travel(
      id: json['id'],
      userId: json['user_id'],
      departureLocation: json['departure_location'],
      destination: json['destination'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      description: json['description'],
      status: json['status'],
      availableWeight: json['available_weight'],
      preferredCategories: json['preferred_categories'],
      purchaseAvailable: json['purchase_available'],
      deliveryOnlyAvailable: json['delivery_only_available'],
      transportationType: json['transportation_type'],
      routeStops: json['route_stops'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'departure_location': departureLocation,
      'destination': destination,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'description': description,
      'status': status,
      'available_weight': availableWeight,
      'preferred_categories': preferredCategories,
      'purchase_available': purchaseAvailable,
      'delivery_only_available': deliveryOnlyAvailable,
      'transportation_type': transportationType,
      'route_stops': routeStops,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
