import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/post.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Post> createPost(Post post) async {
    final docRef = await _firestore.collection('posts').add(post.toJson());
    return post.copyWith(id: docRef.id);
  }

  Future<Post?> getPostById(String id) async {
    final docSnapshot = await _firestore.collection('posts').doc(id).get();
    return docSnapshot.data() != null
        ? Post.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<Post>> getPostsByUser(String userId) async {
    final querySnapshot = await _firestore
        .collection('posts')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot.docs.map((doc) => Post.fromJson(doc.data())).toList();
  }

  Future<List<Post>> getPostsByCategory(String category) async {
    final querySnapshot = await _firestore
        .collection('posts')
        .where('category', isEqualTo: category)
        .get();
    return querySnapshot.docs.map((doc) => Post.fromJson(doc.data())).toList();
  }

  Future<void> incrementViewCount(String postId) async {
    await _firestore.collection('posts').doc(postId).update({
      'view_count': FieldValue.increment(1),
    });
  }
}
