import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/core/colors.dart';
import 'package:fake_store/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColor.secondary,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: product.image,
              child: CachedNetworkImage(
                height: 320,
                width: double.infinity,
                imageUrl: product.image,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://t3.ftcdn.net/jpg/01/09/84/42/360_F_109844239_A7MdQSDf4y1H80cfvHZuSa0zKBkZ68S7.jpg",
                  height: 30,
                  width: 30,
                ),
                Text(
                  " ${product.rating.rate.toString()}",
                  style: const TextStyle(
                    color: AppColor.darkGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppColor.primary,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                product.title,
                style: const TextStyle(
                  color: AppColor.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              Text(
                product.description,
                style: const TextStyle(
                  color: AppColor.secondary,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Total Price",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "₹ ${product.price}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.heavyImpact();
                          showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                              title: const Text("Thanks"),
                              content: const Text("Thanks for your puchase !"),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          color: AppColor.third,
                          width: 120,
                          height: 60,
                          alignment: Alignment.center,
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
