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
      return StoreRatingData.fromJson(response.data);
    } else {
      throw Exception('Invalid response');
    }
  }
}
