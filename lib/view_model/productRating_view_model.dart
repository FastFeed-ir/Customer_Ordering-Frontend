import 'package:flutter/cupertino.dart';

import '../model/entity/productRating.dart';
import '../model/repository/productRating_repository_impl.dart';

class ProductRatingViewModel extends ChangeNotifier {
  var repository = ProductRepositoryImpl();
  ProductRatingData productRatingData = ProductRatingData();
  void getRatings(int storeId) async {
    productRatingData = await repository.getRatings(storeId);
    notifyListeners();
  }
}
