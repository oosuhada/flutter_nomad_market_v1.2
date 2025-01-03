class DisputeDTO {
  final String id;
  final String transactionId;
  final String complainantId;
  final String respondentId;
  final String disputeType;
  final String status;
  final String? resolutionType;
  final String description;

  DisputeDTO({
    required this.id,
    required this.transactionId,
    required this.complainantId,
    required this.respondentId,
    required this.disputeType,
    required this.status,
    this.resolutionType,
    required this.description,
  });

  factory DisputeDTO.fromJson(Map<String, dynamic> json) {
    return DisputeDTO(
      id: json['id'],
      transactionId: json['transaction_id'],
      complainantId: json['complainant_id'],
      respondentId: json['respondent_id'],
      disputeType: json['dispute_type'],
      status: json['status'],
      resolutionType: json['resolution_type'],
      description: json['description'],
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
    };
  }
}
