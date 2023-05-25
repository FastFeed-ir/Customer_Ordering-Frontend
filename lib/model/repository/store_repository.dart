import '../entity/store.dart';
import '../entity/storeRating.dart';

abstract class StoreRepository {
  Future<List<Store>> getStores(int ownerId);

  Future<Store> addStore(Store store);

  Future<void> editStore(Store store);

  Future<void> deleteStore(Store store);

  Future<StoreRatingData> getRatingsAndComments(int storeId);
}
