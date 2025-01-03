import '../../../core/entities/order.dart';

abstract class IOrderRepository {
  Future<Order> createOrder(Order order);
  Future<Order?> getOrderById(String id);
  Future<List<Order>> getOrdersByUser(String userId, String userType);
  Future<Order> updateOrderStatus(String id, String status);
}
