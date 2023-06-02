import 'package:customer_ordering_frontend/model/entity/comment.dart';
import 'package:customer_ordering_frontend/model/repository/store_profile_repository.dart';

import '../entity/store.dart';
import '../util/constants.dart';

// ignore_for_file: avoid_print
class StoreProfileRepositoryImpl extends StoreProfileRepository {
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

  @override
  Future<List<String>> getOrdersNamesOfComment(int orderId) async {
    var response = await dio.get('orders/$orderId/productsName');
    print('response: ${response.statusMessage}');
    if (response.statusCode == 200) {
      Map<String, dynamic> map = response.data;
      List<String> ordersNames = List.from(map['product_names']);
      return ordersNames;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Store> getStore(int storeId) async {
    var response = await dio.get('stores/$storeId');
    print('response: ${response.statusMessage}');
    if (response.statusCode == 200) {
      Store store = Store.fromJson(response.data as Map<String, dynamic>);
      return store;
    } else {
      throw Exception('Invalid response');
    }
  }
}
