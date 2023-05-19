import '../entity/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments(int storeId);

  Future<List<String>> getOrders(int storeId);
}
