import 'dart:convert';
import 'package:fake_store/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class RemoteProductDataSource extends ProductDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];
    try {
      final url = Uri.parse("https://fakestoreapi.com/products");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;
        products =
            jsonData.map((product) => ProductModel.fromJson(product)).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return products;
  }
}
