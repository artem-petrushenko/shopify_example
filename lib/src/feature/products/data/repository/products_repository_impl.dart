import 'package:shopify_example/src/feature/products/data/provider/products_network_data_provider.dart';
import 'package:shopify_example/src/feature/products/data/repository/products_repository.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl({
    required final ProductsNetworkDataProvider productsNetworkDataProvider,
  }) : _productsNetworkDataProvider = productsNetworkDataProvider;

  final ProductsNetworkDataProvider _productsNetworkDataProvider;

  @override
  Future<List<ProductModel>> getProductList() async =>
      await _productsNetworkDataProvider.getProductList();
}
