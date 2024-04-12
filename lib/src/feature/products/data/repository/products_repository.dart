import 'package:shopify_example/src/feature/products/model/product_details_model.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

abstract interface class ProductsRepository {
  Future<List<ProductModel>> getProductList({
    final String? after,
    final String? query,
  });

  Future<ProductDetailsModel> getProductDetails({
    final String? id,
  });
}
