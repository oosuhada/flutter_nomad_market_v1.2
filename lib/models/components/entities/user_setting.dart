import 'dart:convert';

class UserSetting {
  final String id;
  final String userId;
  final Map<String, dynamic> notificationPreferences;
  final String language;
  final String currencyPreference;
  final String timezone;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserSetting({
    required this.id,
    required this.userId,
    required this.notificationPreferences,
    required this.language,
    required this.currencyPreference,
    required this.timezone,
    required this.createdAt,
    required this.updatedAt,
  });

  UserSetting copyWith({
    String? id,
    String? userId,
    Map<String, dynamic>? notificationPreferences,
    String? language,
    String? currencyPreference,
    String? timezone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserSetting(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      notificationPreferences:
          notificationPreferences ?? this.notificationPreferences,
      language: language ?? this.language,
      currencyPreference: currencyPreference ?? this.currencyPreference,
      timezone: timezone ?? this.timezone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory UserSetting.fromJson(Map<String, dynamic> json) {
    return UserSetting(
      id: json['id'],
      userId: json['user_id'],
      notificationPreferences: jsonDecode(json['notification_preferences']),
      language: json['language'],
      currencyPreference: json['currency_preference'],
      timezone: json['timezone'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'notification_preferences': jsonEncode(notificationPreferences),
      'language': language,
      'currency_preference': currencyPreference,
      'timezone': timezone,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
