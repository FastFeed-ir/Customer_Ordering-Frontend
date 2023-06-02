import 'package:flutter/cupertino.dart';

import '../model/entity/productRating.dart';
import '../model/repository/productRating_repository_impl.dart';

class ProductRatingViewModel extends ChangeNotifier {
  var repository = ProductRepositoryImpl();
  late ProductRatingData productRatingData ;

  Future<void>  getRatings(int storeId) async {
    productRatingData = await repository.getRatings(storeId);
    print(productRatingData.averageRating);
    notifyListeners();
  }
}
