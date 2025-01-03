import '../../../core/entities/delivery_offer.dart';

abstract class IDeliveryOfferRepository {
  Future<DeliveryOffer> createDeliveryOffer(DeliveryOffer offer);
  Future<DeliveryOffer?> getDeliveryOfferById(String id);
  Future<List<DeliveryOffer>> getDeliveryOffersByRequest(String requestId);
  Future<List<DeliveryOffer>> getDeliveryOffersByTraveler(String travelerId);
  Future<DeliveryOffer> updateDeliveryOffer(DeliveryOffer offer);
  Future<void> deleteDeliveryOffer(String id);
}
