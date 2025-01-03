import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/entities/transaction.dart' as transaction_model;

class TransactionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<transaction_model.Transaction> createTransaction(
      transaction_model.Transaction transaction) async {
    final docRef =
        await _firestore.collection('transactions').add(transaction.toJson());
    return transaction.copyWith(id: docRef.id);
  }

  Future<transaction_model.Transaction?> getTransactionById(String id) async {
    final docSnapshot =
        await _firestore.collection('transactions').doc(id).get();
    return docSnapshot.data() != null
        ? transaction_model.Transaction.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<transaction_model.Transaction>> getTransactionsByUser(
      String userId, String userType) async {
    final querySnapshot = await _firestore
        .collection('transactions')
        .where(userType == 'buyer' ? 'buyer_id' : 'seller_id',
            isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => transaction_model.Transaction.fromJson(doc.data()))
        .toList();
  }

  Future<void> updateTransactionStatus(
      String id, String paymentStatus, String escrowStatus) async {
    await _firestore.collection('transactions').doc(id).update({
      'payment_status': paymentStatus,
      'escrow_status': escrowStatus,
    });
  }
}
