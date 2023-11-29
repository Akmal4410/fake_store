import 'package:fake_store/data/data_source/product_data_source.dart';
import 'package:fake_store/data/mappers/product_mapper.dart';
import 'package:fake_store/domain/entities/product.dart';
import 'package:fake_store/domain/repositories/i_product_repo.dart';
import 'package:flutter/material.dart';

class ProductRepoImpl implements IProductRepo {
  final ProductDataSource _productDataSource;

  ProductRepoImpl(this._productDataSource);

  @override
  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    try {
      final productModels = await _productDataSource.getProducts();
      products = productModels
          .map((product) => ProductMapper.formProductModel(product))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return products;
  }
}
