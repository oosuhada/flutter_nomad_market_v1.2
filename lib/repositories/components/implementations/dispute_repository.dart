import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/dispute.dart';

class DisputeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Dispute> createDispute(Dispute dispute) async {
    final docRef =
        await _firestore.collection('disputes').add(dispute.toJson());
    return dispute.copyWith(id: docRef.id);
  }

  Future<Dispute?> getDisputeById(String id) async {
    final docSnapshot = await _firestore.collection('disputes').doc(id).get();
    return docSnapshot.data() != null
        ? Dispute.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<Dispute>> getDisputesByUser(
      String userId, String userType) async {
    final querySnapshot = await _firestore
        .collection('disputes')
        .where(userType == 'complainant' ? 'complainant_id' : 'respondent_id',
            isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => Dispute.fromJson(doc.data()))
        .toList();
  }

  Future<void> updateDisputeStatus(String id, String status) async {
    await _firestore.collection('disputes').doc(id).update({'status': status});
  }

  Future<void> resolveDispute(String id, String resolutionType) async {
    await _firestore.collection('disputes').doc(id).update({
      'status': 'resolved',
      'resolution_type': resolutionType,
    });
  }
}
