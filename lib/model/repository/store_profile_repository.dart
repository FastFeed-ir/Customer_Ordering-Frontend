import '../entity/comment.dart';
import '../entity/store.dart';

abstract class StoreProfileRepository {
  Future<List<Comment>> getComments(int storeId);

  Future<List<String>> getOrders(int storeId);

  Future<Store> getStore(int storeId);
}
