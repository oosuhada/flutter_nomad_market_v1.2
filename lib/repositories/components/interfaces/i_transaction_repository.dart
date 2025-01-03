import '../../../core/entities/transaction.dart';

abstract class ITransactionRepository {
  Future<Transaction> createTransaction(Transaction transaction);
  Future<Transaction?> getTransactionById(String id);
  Future<List<Transaction>> getTransactionsByUser(
      String userId, String userType);
  Future<Transaction> updateTransactionStatus(
      String id, String paymentStatus, String escrowStatus);
}
