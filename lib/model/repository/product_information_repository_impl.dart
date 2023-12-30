import 'package:customer_ordering_frontend/model/entity/comment.dart';
import 'package:customer_ordering_frontend/model/repository/product_information_repository.dart';

import '../util/constants.dart';

// ignore_for_file: avoid_print
class ProductInformationRepositoryImpl extends ProductInformationRepository {
  @override
  Future<List<Comment>> getComments(int productId) async {
    var response = await dio.get('order-comments/?product_id=$productId');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Comment> comments = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var commentServer = Comment.fromJson(data);
          //get just date from created at
          final createdAt = commentServer.createdAt;
          if (createdAt != null) {
            commentServer.createdAt = createdAt.split(' ')[0];
          } else {
            commentServer.createdAt = '';
          }
          comments.add(commentServer);
        }
      }
      return comments;
    } else {
      throw Exception('Invalid response');
    }
  }
}
