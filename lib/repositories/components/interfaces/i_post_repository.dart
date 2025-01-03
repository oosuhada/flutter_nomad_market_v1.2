import '../../../core/entities/comment.dart';
import '../../../core/entities/post.dart';

abstract class IPostRepository {
  Future<Post> createPost(Post post);
  Future<Post?> getPostById(String id);
  Future<List<Post>> getPostsByUser(String userId);
  Future<List<Post>> getPostsByCategory(String category);
  Future<Post> updatePost(Post post);
  Future<void> deletePost(String id);
  Future<void> incrementViewCount(String postId);

  Future<Comment> addComment(Comment comment);
  Future<List<Comment>> getCommentsByPost(String postId);
  Future<void> deleteComment(String commentId);
}
