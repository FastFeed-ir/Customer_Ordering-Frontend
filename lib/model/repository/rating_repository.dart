import '../entity/rating.dart';

abstract class RatingRepository {
  Future<List<Rating>> getRate(int id);

  Future<Rating> addRate(Rating rating);

  Future<void> editRate(Rating rating);

  Future<void> deleteRating(Rating rating);
}
