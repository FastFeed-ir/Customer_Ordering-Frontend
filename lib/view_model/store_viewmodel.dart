import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../model/entity/store.dart';
import '../model/repository/store_repository_impl.dart';

class StoreViewModel extends ChangeNotifier {
  var repository = StoreRepositoryImpl();

  StreamController<List<Store>> stores = StreamController<List<Store>>();

  StreamController<Store> store = StreamController<Store>();

  void getStores(int id) async {
    stores.add(await repository.getStores(id));
    notifyListeners();
  }

  Future<Store> addStore(Store store) async {
    var newStore = await repository.addStore(store);
    notifyListeners();
    return newStore;
  }

  void editStore(Store store) async {
    repository.editStore(store);
    notifyListeners();
  }

  void deleteStore(Store store) async {
    repository.deleteStore(store);
    notifyListeners();
  }

  Future<Store> getStore(int storeId) async {
    var store = await repository.getStore(storeId);
    notifyListeners();
    return store;
  }
}
