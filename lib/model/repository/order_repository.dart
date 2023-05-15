import '../entity/order.dart';

abstract class OrderRepository {
  Future<List<int>> getOrdersProductsId(int orderId);
}
