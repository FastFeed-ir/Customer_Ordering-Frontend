import 'package:customer_ordering_frontend/model/entity/productRating.dart';

import '../util/constants.dart';
import 'productRating_repository.dart';

class ProductRepositoryImpl extends ProductRatingRepository {
  @override
  Future<ProductRatingData> getRatings(int productId) async {
    var response = await dio.get('product/$productId/rating/');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      var productRatingData = ProductRatingData.fromJson(response.data);
      return productRatingData;
    }
    else {
      throw Exception('Invalid response');
    }

  }
}
