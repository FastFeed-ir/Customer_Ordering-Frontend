import '../entity/productRating.dart';

abstract class ProductRatingRepository {
  Future<ProductRatingData> getRatings(int productId);
}
