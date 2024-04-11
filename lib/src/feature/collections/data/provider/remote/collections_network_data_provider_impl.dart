import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/get_collections.dart';
import 'package:shopify_example/src/feature/collections/data/provider/remote/collections_network_data_provider.dart';
import 'package:shopify_example/src/feature/collections/model/collection_model.dart';

class CollectionsNetworkDataProviderImpl
    implements CollectionsNetworkDataProvider {
  const CollectionsNetworkDataProviderImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<List<CollectionModel>> getCategories({
    final bool reverse = false,
    final String? cursor,
  }) async {
    final result = await _shopifyGraphQLClient.query(
      document: getCollectionQuery,
      variables: {
        'first': 10,
        'reverse': reverse,
        'cursor': cursor,
      },
    );
    return [
      CollectionModel(),
      CollectionModel(),
    ];
  }
}
