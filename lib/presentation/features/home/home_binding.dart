import 'package:fake_store/domain/use_case/get_products.dart';
import 'package:fake_store/presentation/features/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find<GetProducts>()));
  }
}
