import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_collection.dart';
import 'package:shopify_example/src/feature/collection/data/provider/remote/collection_network_data_provider.dart';
import 'package:shopify_example/src/feature/collection/model/collection_response_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

class CollectionNetworkDataProviderImpl implements CollectionNetworkDataProvider {
  const CollectionNetworkDataProviderImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<List<ProductModel>> getCollectionProducts({
    required final String collectionId,
    final String? after,
    final int first = 10,
    final reverse = false,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getCollectionQuery,
      variables: {
        'collectionId': collectionId,
        'first': first,
        'after': after,
        'reverse': reverse,
      },
    );

    return CollectionResponseModel.fromJson(response.data ?? {})
        .collection
        .products
        .products;
  }
}
