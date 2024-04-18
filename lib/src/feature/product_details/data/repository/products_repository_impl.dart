import 'package:shopify_example/src/feature/product_details/data/provider/products_network_data_provider.dart';
import 'package:shopify_example/src/feature/product_details/data/repository/products_repository.dart';
import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_response_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl({
    required final ProductsNetworkDataProvider productsNetworkDataProvider,
  }) : _productsNetworkDataProvider = productsNetworkDataProvider;

  final ProductsNetworkDataProvider _productsNetworkDataProvider;

  @override
  Future<ProductDetailsModel> getProductDetails({
    required final String id,
  }) async =>
      await _productsNetworkDataProvider.getProductDetails(id: id);

  @override
  Future<ProductVariantResponseModel> getProductVariant({
    required final String id,
    final int first = 8,
  }) async =>
      await _productsNetworkDataProvider.getProductVariant(id: id);
}
