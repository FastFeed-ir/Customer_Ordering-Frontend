import 'package:customer_ordering_frontend/model/entity/productRating.dart';

import '../util/constants.dart';
import 'product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<ProductRatingData> getRatings(int productId) async {
    var response = await dio.get('product/$productId/rating/');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      return ProductRatingData.fromJson(response.data);
    } else {
      throw Exception('Invalid response');
    }
  }
}
