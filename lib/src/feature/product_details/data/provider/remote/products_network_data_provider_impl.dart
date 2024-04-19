import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_product_details.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_product_recommendations.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_product_variant.dart';
import 'package:shopify_example/src/feature/product_details/data/provider/remote/products_network_data_provider.dart';
import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_details_response_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_recommendations_response_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_response_model.dart';

class ProductsNetworkDataProviderImpl implements ProductsNetworkDataProvider {
  const ProductsNetworkDataProviderImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<ProductDetailsModel> getProductDetails({
    required final String id,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getProductDetailsQuery,
      variables: {
        'id': id,
      },
    );
    return ProductDetailsResponseModel.fromJson(response.data ?? {}).product;
  }

  @override
  Future<ProductVariantResponseModel> getProductVariant({
    required final String id,
    final int first = 8,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getProductVariantQuery,
      variables: {
        'id': id,
        'first': first,
      },
    );
    return ProductVariantResponseModel.fromJson(response.data?['product'] ?? {});
  }

  @override
  Future<ProductRecommendationsResponseModel> getRecommendations({
    required final String id,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getProductRecommendationsQuery,
      variables: {
        'id': id,
      },
    );
    return ProductRecommendationsResponseModel.fromJson(response.data ?? {});
  }
}
