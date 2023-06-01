import 'package:flutter/cupertino.dart';
import '../model/entity/storeRating.dart';
import '../model/repository/storeRating_repository_impl.dart';

class StoreRatingViewModel extends ChangeNotifier {
  var repository = StoreRatingRepositoryImpl();
  StoreRatingData storeRatingData = StoreRatingData();

  void getRatings(int storeId) async {
    storeRatingData =  await repository.getRatings(storeId);
    notifyListeners();
  }
}
