class ChatRoom {
  final String id;
  final String name;
  final bool isGroup;
  final DateTime createdAt;

  ChatRoom({
    required this.id,
    required this.name,
    required this.isGroup,
    required this.createdAt,
  });

  ChatRoom copyWith({
    String? id,
    String? name,
    bool? isGroup,
    DateTime? createdAt,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      name: name ?? this.name,
      isGroup: isGroup ?? this.isGroup,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'],
      name: json['name'],
      isGroup: json['is_group'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_group': isGroup,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
