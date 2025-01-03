class UserSession {
  final int userId;
  final String token;
  final DateTime expiresAt;

  UserSession({
    required this.userId,
    required this.token,
    required this.expiresAt,
  });

  bool get isValid => DateTime.now().isBefore(expiresAt);
}
