import 'dart:async';

import 'package:flutter/material.dart';

import '../model/entity/rating.dart';
import '../model/repository/rating_repository_impl.dart';

class RatingViewModel extends ChangeNotifier {
  var repository = RatingRepositoryImpl();

  StreamController<List<Rating>> collections = StreamController<List<Rating>>();

  void getRatings(int productId) async {
    collections.add(await repository.getRatings(productId));
    notifyListeners();
  }

  Future<int> addRating(Rating rating) async {
    var newCollection = await repository.addRating(rating);
    notifyListeners();
    return newCollection.id ?? 0;
  }
}
