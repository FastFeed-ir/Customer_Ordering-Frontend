import '../entity/comment.dart';

abstract class ProductInformationRepository {
  Future<List<Comment>> getComments(int productId);
}
