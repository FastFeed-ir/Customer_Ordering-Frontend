import 'package:customer_ordering_frontend/model/entity/comment.dart';
import 'package:customer_ordering_frontend/model/repository/comment_repository.dart';

import '../util/constants.dart';

// ignore_for_file: avoid_print
class CommentRepositoryImpl extends CommentRepository {
  @override
  Future<List<Comment>> getComments(int storeId) async {
    var response = await dio.get('comments/?store_id=$storeId');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Comment> comments = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var commentServer = Comment.fromJson(data);
          //get just date from created at
          commentServer.createdAt = commentServer.createdAt.split('T')[0];
          comments.add(commentServer);
        }
      }
      return comments;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<List<String>> getOrders(int storeId) async {
    throw UnimplementedError();
  }
}
