import '../entity/collection.dart';
import '../entity/product.dart';

abstract class CollectionRepository {
  Future<List<Collection>> getCollections();

  Future<List<Product>> getProducts();

  Future<Collection> addCollection(Collection collection);

  Future<Product> addProduct(Product product);

  Future<void> editCollection(Collection collection);

  Future<void> editProduct(Product product);

  Future<void> deleteCollection(Collection collection);

  Future<void> deleteProduct(Product product);
}