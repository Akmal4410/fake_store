import 'package:fake_store/domain/entities/product.dart';
import 'package:fake_store/domain/use_case/get_products.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._getProducts);

  final GetProducts _getProducts;

  final Rx<List<Product>> _products = Rx([]);
  RxBool isLoading = RxBool(false);

  List<Product> get products => _products.value;

  @override
  void onInit() async {
    await getProducts();
    super.onInit();
  }

  Future getProducts() async {
    isLoading(true);
    final productsList = await _getProducts.getProducts();
    _products(productsList);
    isLoading(false);
  }
}
