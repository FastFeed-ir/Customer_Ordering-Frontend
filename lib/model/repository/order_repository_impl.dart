import 'package:customer_ordering_frontend/model/entity/order.dart';
import 'package:dio/dio.dart';
import '../util/constants.dart';

import 'order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  var dio = Dio(options);

  @override
  Future<List<Order>> getOrders(int id) async {
    var response = await dio.get('orders/');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Order> orders = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var order = Order.fromJson(data);
          if (order.id == id) {
            orders.add(order);
          }
        }
      }
      return orders;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Order> addOrder(Order order) async {
    var response = await dio.post(
      'orders/',
      data: order,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newOrder = Order.fromJson(response.data);
    return newOrder;
  }
  @override
  Future<void> editOrder(Order order) async {
    var response = await dio.patch(
      'orders/${order.id}/',
      data: order,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> deleteOrder(Order order) async {
    var response = await dio.delete(
      'orders/${order.id}/',
    );
    print('response: ${response.statusMessage}');
  }


  @override
  Future<List<int>> getOrdersProductsId(int orderId) async {
    var response = await dio.get('orders/$orderId/productsID/');
    print('response: ${response.statusMessage}');
    if (response.statusCode == 200) {
      final List<dynamic> productIds = response.data['product_ids'];
      // Remove duplicates from the list
      final List<dynamic> uniqueProductIds = productIds.toSet().toList();
      return uniqueProductIds.cast<int>();
    } else {
      throw Exception('Invalid response');
    }
  }
}
