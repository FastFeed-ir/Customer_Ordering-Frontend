import 'dart:async';

import 'package:flutter/material.dart';

import '../model/entity/comment.dart';
import '../model/entity/store.dart';
import '../model/repository/store_profile_repository_impl.dart';

class StoreProfileViewModel extends ChangeNotifier {
  var repository = StoreProfileRepositoryImpl();

  StreamController<List<Comment>> comments = StreamController<List<Comment>>();

  StreamController<List<String>> ordersNames = StreamController<List<String>>();

  void getOrders(int storeId) async {
    ordersNames.add(await repository.getOrders(storeId));
    notifyListeners();
  }

  void getComments(int storeId) async {
    comments.add(await repository.getComments(storeId));
    notifyListeners();
  }

  Future<Store> getStore(int storeId) async {
    var store = await repository.getStore(storeId);
    notifyListeners();
    return store;
  }
}
