import '../entity/rating.dart';

abstract class RatingRepository {
  Future<List<Rating>> getRatings(int productId);

  Future<Rating> addComment(Rating rating);
}
