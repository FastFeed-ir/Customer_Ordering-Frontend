import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../model/repository/Rating_repository_impl.dart';
import '../model/entity/rating.dart';
class RatingViewModel extends ChangeNotifier {
  var repository = RatingRepositoryImpl();

  StreamController<List<Rating>> ratings =
      StreamController<List<Rating>>();
  void getRatings(int id) async {
    ratings.add(await repository.getRate(id));
    notifyListeners();
  }

  Future<Rating> addRating(Rating rating) async {
    var newRating = await repository.addRate(rating);
    notifyListeners();
    return newRating;
  }

  void editRating(Rating rating) async {
    await repository.editRate(rating);
    notifyListeners();
  }

  void deleteRating(Rating rating) async {
    await repository.deleteRating(rating);
    notifyListeners();
  }
}
