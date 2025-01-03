class UserDTO {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String role;
  final String? profileImage;
  final bool isVerified;
  final double reputationScore;

  UserDTO({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    this.profileImage,
    required this.isVerified,
    required this.reputationScore,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      role: json['role'],
      profileImage: json['profile_image'],
      isVerified: json['is_verified'],
      reputationScore: json['reputation_score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'role': role,
      'profile_image': profileImage,
      'is_verified': isVerified,
      'reputation_score': reputationScore,
    };
  }
}
