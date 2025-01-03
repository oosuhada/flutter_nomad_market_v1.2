class Post {
  final String id;
  final String userId;
  final String content;
  final String category;
  final String viewCount;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    required this.category,
    required this.viewCount,
    required this.createdAt,
  });

  Post copyWith({
    String? id,
    String? userId,
    String? content,
    String? category,
    String? viewCount,
    DateTime? createdAt,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      category: category ?? this.category,
      viewCount: viewCount ?? this.viewCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['user_id'],
      content: json['content'],
      category: json['category'],
      viewCount: json['view_count'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'content': content,
      'category': category,
      'view_count': viewCount,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
