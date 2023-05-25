import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../model/entity/orderItem.dart';
import '../model/repository/orderItem_repository_impl.dart';


class OrderItemViewModel extends ChangeNotifier {
  var repository = OrderItemRepositoryImpl();

  StreamController<List<OrderItem>> orderItems =
  StreamController<List<OrderItem>>();

  void getOrderItems(int id) async {
    orderItems.add(await repository.getOrderItems(id));
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