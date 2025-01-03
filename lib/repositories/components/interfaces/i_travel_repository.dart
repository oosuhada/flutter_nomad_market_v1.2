import '../../../core/entities/travel.dart';

abstract class ITravelRepository {
  Future<Travel> createTravel(Travel travel);
  Future<Travel?> getTravelById(String id);
  Future<List<Travel>> getTravelsByUser(String userId);
  Future<List<Travel>> searchTravels(String destination, DateTime startDate);
  Future<Travel> updateTravel(Travel travel);
  Future<void> deleteTravel(String id);
}
