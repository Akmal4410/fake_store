import 'package:fake_store/domain/entities/product.dart';
import 'package:fake_store/domain/repositories/i_product_repo.dart';

abstract class GetProducts {
  Future<List<Product>> getProducts();
}

class GetProductsImpl extends GetProducts {
  GetProductsImpl(this._iProductRepo);

  final IProductRepo _iProductRepo;

  @override
  Future<List<Product>> getProducts() {
    return _iProductRepo.getProducts();
  }
}
