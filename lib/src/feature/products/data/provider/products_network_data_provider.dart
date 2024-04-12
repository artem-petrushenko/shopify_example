import 'package:shopify_example/src/feature/products/model/product_details_model.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

abstract interface class ProductsNetworkDataProvider {
  Future<List<ProductModel>> getProductList({
    final bool reverse = false,
    final String? after,
    final String? query,
    final int first = 8,
  });

  Future<ProductDetailsModel> getProductDetails({
    final String? id,
  });
}
