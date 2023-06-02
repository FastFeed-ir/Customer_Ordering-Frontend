import '../util/constants.dart';
import 'order_repository.dart';

class OrderRepositoryImplDart extends OrderRepository {
  @override
  Future<List<int>> getOrdersProductsId(int orderId) async {
    var response = await dio.get('orders/$orderId/productsID/');
    print('response: ${response.statusMessage}');
    if (response.statusCode == 200) {
      final List<dynamic> productIds = response.data['product_ids'];
      // Remove duplicates from the list
      final List<dynamic> uniqueProductIds = productIds.toSet().toList();
      return uniqueProductIds.cast<int>();
    } else {
      throw Exception('Invalid response');
    }
  }
}
