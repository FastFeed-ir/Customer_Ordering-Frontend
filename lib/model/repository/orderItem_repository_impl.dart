import 'package:customer_ordering_frontend/model/entity/orderItem.dart';
import 'package:dio/dio.dart';
import '../util/constants.dart';
import 'orderItem_repository.dart';

class OrderItemRepositoryImpl extends OrderItemRepository {
  var dio = Dio(options);

  @override
  Future<List<OrderItem>> getOrderItems(int id) async {
    var response = await dio.get('order_items/');
    print('response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<OrderItem> orderItems = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var orderItem = OrderItem.fromJson(data);
          if(orderItem.id == id) {
            orderItems.add(orderItem);
          }
        }
      }
      return orderItems;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<OrderItem> addOrderItem(OrderItem orderItem) async {
    var response = await dio.post(
      'order_items/',
      data: orderItem,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newOrderItem = OrderItem.fromJson(response.data);
    return newOrderItem;
  }
  @override
  Future<void> editOrderItem(OrderItem orderItem) async {
    var response = await dio.patch(
      'order_items/${orderItem.id}/',
      data: orderItem,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deleteOrderItem(OrderItem orderItem) async {
    var response = await dio.delete(
      'order_items/${orderItem.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}