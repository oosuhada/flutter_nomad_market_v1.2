import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/order.dart' as order_model;

class OrderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<order_model.Order> createOrder(order_model.Order order) async {
    final docRef = await _firestore.collection('orders').add(order.toJson());
    return order.copyWith(id: docRef.id);
  }

  Future<order_model.Order?> getOrderById(String id) async {
    final docSnapshot = await _firestore.collection('orders').doc(id).get();
    return docSnapshot.data() != null
        ? order_model.Order.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<order_model.Order>> getOrdersByUser(
      String userId, String userType) async {
    final querySnapshot = await _firestore
        .collection('orders')
        .where(userType == 'buyer' ? 'buyer_id' : 'seller_id',
            isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => order_model.Order.fromJson(doc.data()))
        .toList();
  }

  Future<void> updateOrderStatus(String id, String status) async {
    await _firestore.collection('orders').doc(id).update({'status': status});
  }
}
