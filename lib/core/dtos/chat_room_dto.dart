class ChatRoomDTO {
  final String id;
  final String name;
  final bool isGroup;

  ChatRoomDTO({
    required this.id,
    required this.name,
    required this.isGroup,
  });

  factory ChatRoomDTO.fromJson(Map<String, dynamic> json) {
    return ChatRoomDTO(
      id: json['id'],
      name: json['name'],
      isGroup: json['is_group'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_group': isGroup,
    };
  }
}
