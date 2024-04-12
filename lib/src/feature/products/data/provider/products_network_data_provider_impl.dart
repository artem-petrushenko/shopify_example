import 'package:shopify_example/src/core/components/graphql_client/query/get_product_details.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/get_products.dart';
import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/utils/mixin/api_call_mixin.dart';
import 'package:shopify_example/src/feature/products/data/provider/products_network_data_provider.dart';
import 'package:shopify_example/src/feature/products/model/product_details_model.dart';
import 'package:shopify_example/src/feature/products/model/product_details_response_model.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';
import 'package:shopify_example/src/feature/products/model/products_response_model.dart';

class ProductsNetworkDataProviderImpl
    with ApiCallMixin
    implements ProductsNetworkDataProvider {
  const ProductsNetworkDataProviderImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<List<ProductModel>> getProductList({
    final bool reverse = false,
    final String? after,
    final String? query,
    final int first = 8,
  }) async {
    final result = await execute(
      () => _shopifyGraphQLClient.query(
        document: getProductsQuery,
        variables: {
          'first': first,
          'query': query,
          'after': after,
          'reverse': reverse,
        },
      ),
    );

    final response = ProductsResponseModel.fromJson(result.data ?? {});

    return response.products.products;
  }

  @override
  Future<ProductDetailsModel> getProductDetails({
    final String? id,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getProductDetailsQuery,
      variables: {
        'id': id,
      },
    );
    return ProductDetailsResponseModel.fromJson(response.data ?? {}).product;
  }
}
