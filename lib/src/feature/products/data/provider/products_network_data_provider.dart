import 'package:shopify_example/src/feature/products/model/product_model.dart';

abstract interface class ProductsNetworkDataProvider {
  Future<List<ProductModel>> getProductList({
    final bool reverse = false,
  });
}
