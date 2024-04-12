import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/get_collection.dart';
import 'package:shopify_example/src/feature/collection/data/provider/remote/collection_network_data_provider.dart';
import 'package:shopify_example/src/feature/collection/model/collection_response_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

class CollectionNetworkDataProviderImpl implements CollectionNetworkDataProvider {
  const CollectionNetworkDataProviderImpl({
    required final GraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final GraphQLClient _shopifyGraphQLClient;

  @override
  Future<List<ProductModel>> getCollectionProducts({
    required final String collectionId,
    final String? after,
    final int first = 10,
    final reverse = false,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      QueryOptions(
        document: gql(getCollectionQuery),
        variables: {
          'collectionId': collectionId,
          'first': first,
          'after': after,
          'reverse': reverse,
        },
      ),
    );

    return CollectionResponseModel.fromJson(response.data ?? {}).collection.products.products;
  }
}
