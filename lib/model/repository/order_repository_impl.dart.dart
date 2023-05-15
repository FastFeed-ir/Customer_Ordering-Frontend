import '../util/constants.dart';
import 'order_repository.dart';

class OrderRepositoryImplDart extends OrderRepository {
  @override
  Future<List<int>> getOrdersProductsId(int orderId) async {
    var response = await dio.get('orders/$orderId/productsID/');
    print('response: ${response.statusMessage}');
    if (response.statusCode == 200) {
      final dataList = response.data;
      List<int> ids = List<int>.from(dataList['product_names']);
      // Remove duplicates from the list
      List<int> uniqueIds = ids.toSet().toList();
      return uniqueIds;
    } else {
      throw Exception('Invalid response');
    }
  }
}
