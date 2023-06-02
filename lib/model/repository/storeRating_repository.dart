import '../entity/storeRating.dart';

abstract class StoreRatingRepository {
  Future<StoreRatingData> getRatings(int productId);
}
