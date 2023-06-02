import 'dart:async';

import 'package:flutter/material.dart';

import '../model/entity/rating.dart';
import '../model/repository/rating_repository_impl.dart';

class RatingViewModel extends ChangeNotifier {
  var repository = RatingRepositoryImpl();

  StreamController<List<Rating>> ratings = StreamController<List<Rating>>();

  void getRatings(int productId) async {
    ratings.add(await repository.getRatings(productId));
    notifyListeners();
  }

  Future<int> addRating(Rating rating) async {
    var newRating = await repository.addRating(rating);
    notifyListeners();
    return newRating.id ?? 0;
  }
}
