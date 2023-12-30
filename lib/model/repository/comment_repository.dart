import '../entity/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments(int storeId);

  Future<Comment> addComment(Comment comment);
}
