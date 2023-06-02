
import '../util/constants.dart';
import 'package:customer_ordering_frontend/model/entity/rating.dart';
import 'package:customer_ordering_frontend/model/repository/rating_repository.dart';

class RatingRepositoryImpl extends RatingRepository {
  @override
  Future<Rating> addRating(Rating rating) async {
    var response = await dio.post(
      'ratings/',
      data: rating,
    );
    print('response: ${response.statusMessage}');
    final newRating = Rating.fromJson(response.data);
    return newRating;
  }

  @override
  Future<List<Rating>> getRatings(int productId) async {
    var response = await dio.get('ratings/?product_id=$productId/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Rating> ratings = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var ratingServer = Rating.fromJson(data);
          ratings.add(ratingServer);
        }
      }
      return ratings;
    } else {
      throw Exception('Invalid response');
    }
  }
}
