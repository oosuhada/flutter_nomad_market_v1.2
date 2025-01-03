import '../../../models/components/entities/purchase_request.dart';

abstract class IPurchaseRequestRepository {
  Future<PurchaseRequest> createPurchaseRequest(PurchaseRequest request);
  Future<PurchaseRequest?> getPurchaseRequestById(String id);
  Future<List<PurchaseRequest>> getPurchaseRequestsByBuyer(String buyerId);
  Future<List<PurchaseRequest>> getPurchaseRequestsByStatus(String status);
  Future<PurchaseRequest> updatePurchaseRequest(PurchaseRequest request);
  Future<void> deletePurchaseRequest(String id);
}
