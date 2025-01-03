class PostDTO {
  final String id;
  final String userId;
  final String content;
  final String category;
  final String viewCount;

  PostDTO({
    required this.id,
    required this.userId,
    required this.content,
    required this.category,
    required this.viewCount,
  });

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    return PostDTO(
      id: json['id'],
      userId: json['user_id'],
      content: json['content'],
      category: json['category'],
      viewCount: json['view_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'content': content,
      'category': category,
      'view_count': viewCount,
    };
  }
}
