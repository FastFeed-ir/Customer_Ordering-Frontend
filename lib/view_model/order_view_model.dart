import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../model/entity/order.dart';
import '../model/repository/order_repository_impl.dart';

class OrderViewModel extends ChangeNotifier {
  var repository = OrderRepositoryImpl();

  StreamController<List<Order>> orders = StreamController<List<Order>>();
  StreamController<List<int>> Ids = StreamController<List<int>>();
  late int lastOrderId;
  late Order lastOrder;
  void getProductsIds(int orderId) async {
    Ids.add(await repository.getOrdersProductsId(orderId));
    notifyListeners();
  }

  Future<void> getLastOrder(int storeId, int tableNumber) async {
    lastOrder = await repository.getLastOrderFromTable(storeId, tableNumber);
    lastOrderId = lastOrder.id!;
    notifyListeners();
  }

  void getOrders(int id) async {
    orders.add(await repository.getOrders(id));
    notifyListeners();
  }

  Future<Order> addOrder(Order order, int tableNumber) async {
    var newOrder = await repository.addOrder(order);
    newOrder.tableNumber=tableNumber;
    notifyListeners();
    return newOrder;
  }

  void editOrder(Order order) async {
    repository.editOrder(order);
    notifyListeners();
  }

  void deleteOrder(Order order) async {
    repository.deleteOrder(order);
    notifyListeners();
  }
}
