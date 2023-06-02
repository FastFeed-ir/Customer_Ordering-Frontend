import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../model/entity/order.dart';
import '../model/repository/order_repository_Impl.dart';

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

  void getLastOrder(int storeId, int tableNumber) async {
    lastOrder = repository.getLastOrderFromTable(storeId, tableNumber) as Order;
    lastOrderId = lastOrder.id!;
    notifyListeners();
  }

  void getOrders(int id) async {
    orders.add(await repository.getOrders(id));
    notifyListeners();
  }

  Future<Order> addOrder(Order order) async {
    var newOrder = await repository.addOrder(order);
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
