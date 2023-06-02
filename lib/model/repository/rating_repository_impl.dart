
import 'package:customer_ordering_frontend/model/entity/rating.dart';
import 'package:customer_ordering_frontend/model/repository/rating_repository.dart';

import '../util/constants.dart';

// ignore_for_file: avoid_print
class RatingRepositoryImpl extends RatingRepository {
  @override
  Future<List<Rating>> getRate(int id) async {
    var response = await dio.get('product/$id/rating/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Rating> ratings = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var ratingServer = Rating.fromJson(data);
          //TODO fix storeId
          ratings.add(ratingServer);
        }
      }
      return ratings;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<Rating> addRate(Rating rating) async{
    var response = await dio.post(
      'products/',
      data: rating,
    );
    print('response: ${response.statusMessage}');
    final newRating = Rating.fromJson(response.data);
    return newRating;
  }
  @override
  Future<void> editRate(Rating rating) async{
    var response = await dio.patch(
      'products/${rating.id}/',
      data: rating,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deleteRating(Rating rating) async{
    var response = await dio.delete(
      'products/${rating.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}
