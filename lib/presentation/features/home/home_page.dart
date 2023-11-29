import 'package:fake_store/core/colors.dart';
import 'package:fake_store/presentation/features/home/home_controller.dart';
import 'package:fake_store/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: const Text(
          "Fake Store",
          style: TextStyle(
            color: AppColor.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.products.isEmpty
                ? const Center(child: Text("No Products Found"))
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: controller.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return ProductCard(
                        product: product,
                      );
                    },
                  ),
      ),
    );
  }
}
