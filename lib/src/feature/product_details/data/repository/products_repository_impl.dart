import 'package:shopify_example/src/feature/product_details/data/provider/products_network_data_provider.dart';
import 'package:shopify_example/src/feature/product_details/data/repository/products_repository.dart';
import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl({
    required final ProductsNetworkDataProvider productsNetworkDataProvider,
  }) : _productsNetworkDataProvider = productsNetworkDataProvider;

  final ProductsNetworkDataProvider _productsNetworkDataProvider;

  @override
  Future<ProductDetailsModel> getProductDetails({
    final String? id,
  }) async =>
      await _productsNetworkDataProvider.getProductDetails(
        id: id,
      );
}
