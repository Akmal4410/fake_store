import 'package:fake_store/presentation/features/home/home_binding.dart';
import 'package:fake_store/presentation/features/home/home_page.dart';
import 'package:fake_store/presentation/features/product/product_page.dart';
import 'package:fake_store/presentation/features/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static const String kSplash = '/splash';
  static const String kHome = '/home';
  static const String kProduct = '/product';

  static List<GetPage> getPages() => [
        GetPage(
          name: kSplash,
          page: SplashPage.new,
        ),
        GetPage(
          name: kHome,
          page: HomePage.new,
          binding: HomeBinding(),
        ),
        GetPage(
          name: kProduct,
          page: ProductPage.new,
        ),
      ];
}
