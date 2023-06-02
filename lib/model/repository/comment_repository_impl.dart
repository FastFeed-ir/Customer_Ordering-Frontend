import '../entity/comment.dart';
import '../util/constants.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl extends CommentRepository {
  @override
  Future<List<Comment>> getComments(int storeId) async {
    var response = await dio.get('comments/?store_id=$storeId/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Comment> comments = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var commentServer = Comment.fromJson(data);
          comments.add(commentServer);
        }
      }
      return comments;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Comment> addComment(Comment comment) async {
    var response = await dio.post(
      'comments/',
      data: comment,
    );
    print('response: ${response.statusMessage}');
    final newComment = Comment.fromJson(response.data);
    return newComment;
  }
}
