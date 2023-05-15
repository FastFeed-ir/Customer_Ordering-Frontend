import 'dart:async';

import 'package:flutter/material.dart';

import '../model/repository/order_repository_impl.dart.dart';

class OrderViewModel extends ChangeNotifier {
  var repository = OrderRepositoryImplDart();
  StreamController<List<int>> Ids = StreamController<List<int>>();

  void getProductsIds(int orderId) async {
    Ids.add(await repository.getOrdersProductsId(orderId));
    notifyListeners();
  }
}
