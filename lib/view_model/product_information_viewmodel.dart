import 'dart:async';

import 'package:customer_ordering_frontend/model/repository/product_information_repository_impl.dart';
import 'package:flutter/material.dart';

import '../model/entity/comment.dart';

class ProductInformationViewModel extends ChangeNotifier {
  var repository = ProductInformationRepositoryImpl();

  StreamController<List<Comment>> comments = StreamController<List<Comment>>();

  void getComments(int productId) async {
    comments.add(await repository.getComments(productId));
    notifyListeners();
  }
}
