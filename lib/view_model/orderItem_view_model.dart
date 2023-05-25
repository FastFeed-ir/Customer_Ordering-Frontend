import 'dart:async';
import 'package:customer_ordering_frontend/model/entity/orderItem.dart';
import 'package:flutter/cupertino.dart';

import '../model/repository/orderItem_repository_impl.dart';

class StoreViewModel extends ChangeNotifier {
  var repository = OrderItemRepositoryImpl();

  StreamController<List<OrderItem>> orderItems =
      StreamController<List<OrderItem>>();

  void getOrderItems(int orderId) async {
    orderItems.add(await repository.getOrderItems(orderId));
    notifyListeners();
  }

  Future<OrderItem> addOrderItem(OrderItem orderItem) async {
    var newOrderItem = await repository.addOrderItem(orderItem);
    notifyListeners();
    return newOrderItem;
  }

  void editOrderItem(OrderItem orderItem) async {
    repository.editOrderItem(orderItem);
    notifyListeners();
  }

  void deleteOrderItem(OrderItem orderItem) async {
    repository.deleteOrderItem(orderItem);
    notifyListeners();
  }
}
