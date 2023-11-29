// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/core/colors.dart';
import 'package:fake_store/core/routes/app_routes.dart';
import 'package:fake_store/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends GetView {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.kProduct, arguments: product),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(height: 10),
              Hero(
                tag: product.image,
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: product.image,
                  height: 175,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: const TextStyle(
                  color: AppColor.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product.description,
                style: const TextStyle(
                  color: AppColor.secondary,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "₹ ${product.price.toString()}",
                    style: const TextStyle(
                      color: AppColor.darkGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://t3.ftcdn.net/jpg/01/09/84/42/360_F_109844239_A7MdQSDf4y1H80cfvHZuSa0zKBkZ68S7.jpg",
                        height: 20,
                        width: 20,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
