class Dispute {
  final String id;
  final String transactionId;
  final String complainantId;
  final String respondentId;
  final String disputeType;
  final String status;
  final String? resolutionType;
  final String description;
  final DateTime createdAt;

  Dispute({
    required this.id,
    required this.transactionId,
    required this.complainantId,
    required this.respondentId,
    required this.disputeType,
    required this.status,
    this.resolutionType,
    required this.description,
    required this.createdAt,
  });

  Dispute copyWith({
    String? id,
    String? transactionId,
    String? complainantId,
    String? respondentId,
    String? disputeType,
    String? status,
    String? resolutionType,
    String? description,
    DateTime? createdAt,
  }) {
    return Dispute(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      complainantId: complainantId ?? this.complainantId,
      respondentId: respondentId ?? this.respondentId,
      disputeType: disputeType ?? this.disputeType,
      status: status ?? this.status,
      resolutionType: resolutionType ?? this.resolutionType,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Dispute.fromJson(Map<String, dynamic> json) {
    return Dispute(
      id: json['id'],
      transactionId: json['transaction_id'],
      complainantId: json['complainant_id'],
      respondentId: json['respondent_id'],
      disputeType: json['dispute_type'],
      status: json['status'],
      resolutionType: json['resolution_type'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaction_id': transactionId,
      'complainant_id': complainantId,
      'respondent_id': respondentId,
      'dispute_type': disputeType,
      'status': status,
      'resolution_type': resolutionType,
      'description': description,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
