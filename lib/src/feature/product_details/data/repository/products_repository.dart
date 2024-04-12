import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';

abstract interface class ProductsRepository {
  Future<ProductDetailsModel> getProductDetails({
    final String? id,
  });
}
