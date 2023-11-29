import 'package:fake_store/domain/entities/product.dart';

abstract class IProductRepo {
  Future<List<Product>> getProducts();
}
