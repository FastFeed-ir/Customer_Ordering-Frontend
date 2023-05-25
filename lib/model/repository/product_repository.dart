import '../entity/productRating.dart';

abstract class ProductRepository {
  Future<ProductRatingData> getRatings(int productId);
}
