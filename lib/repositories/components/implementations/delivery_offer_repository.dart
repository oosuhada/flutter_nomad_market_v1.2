import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/components/entities/delivery_offer.dart';

class DeliveryOfferRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DeliveryOffer> createDeliveryOffer(DeliveryOffer offer) async {
    final docRef =
        await _firestore.collection('delivery_offers').add(offer.toJson());
    return offer.copyWith(id: docRef.id);
  }

  Future<DeliveryOffer?> getDeliveryOfferById(String id) async {
    final docSnapshot =
        await _firestore.collection('delivery_offers').doc(id).get();
    return docSnapshot.data() != null
        ? DeliveryOffer.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<DeliveryOffer>> getDeliveryOffersByRequest(
      String requestId) async {
    final querySnapshot = await _firestore
        .collection('delivery_offers')
        .where('request_id', isEqualTo: requestId)
        .get();
    return querySnapshot.docs
        .map((doc) => DeliveryOffer.fromJson(doc.data()))
        .toList();
  }

  Future<void> updateDeliveryOfferStatus(String id, String status) async {
    await _firestore
        .collection('delivery_offers')
        .doc(id)
        .update({'status': status});
  }
}
