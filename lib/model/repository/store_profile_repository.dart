import '../entity/comment.dart';
import '../entity/store.dart';

abstract class StoreProfileRepository {
  Future<List<Comment>> getComments(int storeId);

  Future<List<String>> getOrdersNamesOfComment(int orderId);

  Future<Store> getStore(int storeId);
}
