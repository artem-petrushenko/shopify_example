import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';

abstract interface class ProductsNetworkDataProvider {
  Future<ProductDetailsModel> getProductDetails({
    final String? id,
  });
}
