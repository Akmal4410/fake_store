import 'package:fake_store/data/data_source/product_data_source.dart';
import 'package:fake_store/data/repositories/product_repo_impl.dart';
import 'package:fake_store/domain/repositories/i_product_repo.dart';
import 'package:fake_store/domain/use_case/get_products.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  Get.put<ProductDataSource>(RemoteProductDataSource());
  Get.put<IProductRepo>(ProductRepoImpl(Get.find<ProductDataSource>()));
  Get.put<GetProducts>(GetProductsImpl(Get.find<IProductRepo>()));
}
