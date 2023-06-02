import '../entity/order.dart';

abstract class OrderRepository {
  
  Future<List<int>> getOrdersProductsId(int orderId);
  
  Future<List<Order>> getOrders(int id);

  Future<Order> addOrder(Order order);

  Future<void> editOrder(Order order);

  Future<void> deleteOrder(Order order);

}
