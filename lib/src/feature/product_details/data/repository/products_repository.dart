import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_response_model.dart';

abstract interface class ProductsRepository {
  Future<ProductDetailsModel> getProductDetails({
    required final String id,
  });

  Future<ProductVariantResponseModel> getProductVariant({
    required final String id,
    final int first = 8,
  });
}
