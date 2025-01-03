class UserVerification {
  final String id;
  final String userId;
  final String verificationType;
  final String documentUrl;
  final DateTime? verifiedAt;
  final DateTime expiresAt;
  final String status;

  UserVerification({
    required this.id,
    required this.userId,
    required this.verificationType,
    required this.documentUrl,
    this.verifiedAt,
    required this.expiresAt,
    required this.status,
  });

  UserVerification copyWith({
    String? id,
    String? userId,
    String? verificationType,
    String? documentUrl,
    DateTime? verifiedAt,
    DateTime? expiresAt,
    String? status,
  }) {
    return UserVerification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      verificationType: verificationType ?? this.verificationType,
      documentUrl: documentUrl ?? this.documentUrl,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      status: status ?? this.status,
    );
  }

  factory UserVerification.fromJson(Map<String, dynamic> json) {
    return UserVerification(
      id: json['id'],
      userId: json['user_id'],
      verificationType: json['verification_type'],
      documentUrl: json['document_url'],
      verifiedAt: json['verified_at'] != null
          ? DateTime.parse(json['verified_at'])
          : null,
      expiresAt: DateTime.parse(json['expires_at']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'verification_type': verificationType,
      'document_url': documentUrl,
      'verified_at': verifiedAt?.toIso8601String(),
      'expires_at': expiresAt.toIso8601String(),
      'status': status,
    };
  }
}
