import '../../../models/components/entities/dispute.dart';

abstract class IDisputeRepository {
  Future<Dispute> createDispute(Dispute dispute);
  Future<Dispute?> getDisputeById(String id);
  Future<List<Dispute>> getDisputesByUser(String userId, String userType);
  Future<Dispute> updateDisputeStatus(String id, String status);
  Future<Dispute> resolveDispute(String id, String resolutionType);
}
