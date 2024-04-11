import 'package:shopify_example/src/core/components/graphql_client/query/get_products.dart';
import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/utils/mixin/api_call_mixin.dart';
import 'package:shopify_example/src/feature/products/data/provider/products_network_data_provider.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

class ProductsNetworkDataProviderImpl with ApiCallMixin implements ProductsNetworkDataProvider {
  const ProductsNetworkDataProviderImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<List<ProductModel>> getProductList({
    final bool reverse = false,
    final String? cursor,
  }) async {
    final result = await execute(
      () => _shopifyGraphQLClient.query(
        document: getProductsQuery,
        variables: {
          'cursor': cursor,
          'reverse': reverse,
        },
      ),
    );
    return [];
  }
}
