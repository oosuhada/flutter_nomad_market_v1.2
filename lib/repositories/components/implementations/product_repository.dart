import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/components/entities/product.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Product> createProduct(Product product) async {
    final docRef =
        await _firestore.collection('products').add(product.toJson());
    return product.copyWith(id: docRef.id);
  }

  Future<Product?> getProductById(String id) async {
    final docSnapshot = await _firestore.collection('products').doc(id).get();
    return docSnapshot.data() != null
        ? Product.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<Product>> getProductsBySeller(String sellerId) async {
    final querySnapshot = await _firestore
        .collection('products')
        .where('seller_id', isEqualTo: sellerId)
        .get();
    return querySnapshot.docs
        .map((doc) => Product.fromJson(doc.data()))
        .toList();
  }

  Future<void> updateProductStatus(String id, String status) async {
    await _firestore.collection('products').doc(id).update({'status': status});
  }

  Future<void> addProductImage(String productId, String imageUrl) async {
    await _firestore.collection('product_images').add({
      'product_id': productId,
      'image_url': imageUrl,
      'created_at': FieldValue.serverTimestamp(),
    });
  }
}
