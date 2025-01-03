import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/components/entities/travel.dart';

class TravelRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Travel> createTravel(Travel travel) async {
    final docRef = await _firestore.collection('travels').add(travel.toJson());
    return travel.copyWith(id: docRef.id);
  }

  Future<Travel?> getTravelById(String id) async {
    final docSnapshot = await _firestore.collection('travels').doc(id).get();
    return docSnapshot.data() != null
        ? Travel.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<List<Travel>> getTravelsByUser(String userId) async {
    final querySnapshot = await _firestore
        .collection('travels')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => Travel.fromJson(doc.data()))
        .toList();
  }

  Future<List<Travel>> searchTravels(
      String destination, DateTime startDate) async {
    final querySnapshot = await _firestore
        .collection('travels')
        .where('destination', isEqualTo: destination)
        .where('start_date', isGreaterThanOrEqualTo: startDate)
        .get();
    return querySnapshot.docs
        .map((doc) => Travel.fromJson(doc.data()))
        .toList();
  }

  Future<void> updateTravelStatus(String id, String status) async {
    await _firestore.collection('travels').doc(id).update({'status': status});
  }
}
