import 'package:fake_store/data/models/product_model.dart';
import 'package:fake_store/domain/entities/product.dart';

class ProductMapper {
  static Product formProductModel(ProductModel product) {
    return Product(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      rating: Rating(rate: product.rating.rate, count: product.rating.count),
    );
  }
}
