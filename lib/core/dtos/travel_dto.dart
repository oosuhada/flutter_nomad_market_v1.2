class TravelDTO {
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

  TravelDTO({
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
  });

  factory TravelDTO.fromJson(Map<String, dynamic> json) {
    return TravelDTO(
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
    };
  }
}
