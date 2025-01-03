import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/components/entities/purchase_request.dart';

class PurchaseRequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<PurchaseRequest> createPurchaseRequest(PurchaseRequest request) async {
    final docRef =
        await _firestore.collection('purchase_requests').add(request.toJson());
    return request.copyWith(id: docRef.id);
  }

  Future<PurchaseRequest?> getPurchaseRequestById(String id) async {
    final docSnapshot =
        await _firestore.collection('purchase_requests').doc(id).get();
    return docSnapshot.data() != null
        ? PurchaseRequest.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<PurchaseRequest>> getPurchaseRequestsByBuyer(
      String buyerId) async {
    final querySnapshot = await _firestore
        .collection('purchase_requests')
        .where('buyer_id', isEqualTo: buyerId)
        .get();
    return querySnapshot.docs
        .map((doc) => PurchaseRequest.fromJson(doc.data()))
        .toList();
  }

  Future<void> updatePurchaseRequestStatus(String id, String status) async {
    await _firestore
        .collection('purchase_requests')
        .doc(id)
        .update({'status': status});
  }
}
