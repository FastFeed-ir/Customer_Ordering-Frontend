import '../entity/storeRating.dart';
import '../util/constants.dart';
import 'storeRating_repository.dart';

class StoreRatingRepositoryImpl extends StoreRatingRepository {
  @override
  Future<StoreRatingData> getRatings(int storeId) async {
    var response = await dio.get('/$storeId/rating/');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      var storeRatingData = StoreRatingData.fromJson(response.data);
      return storeRatingData;
    } else {
      throw Exception('Invalid response');
    }
  }
}
