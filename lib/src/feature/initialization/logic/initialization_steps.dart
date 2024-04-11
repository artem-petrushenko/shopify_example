import 'dart:async';

import 'package:graphql/client.dart';
import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/graph_ql_endpoint.dart';
import 'package:shopify_example/src/feature/collections/data/provider/remote/collections_network_data_provider_impl.dart';
import 'package:shopify_example/src/feature/collections/data/repository/collections_repository_impl.dart';
import 'package:shopify_example/src/feature/initialization/model/initialization_proccess.dart';
import 'package:shopify_example/src/feature/products/data/provider/products_network_data_provider_impl.dart';
import 'package:shopify_example/src/feature/products/data/repository/products_repository_impl.dart';

/// A function which represents a single initialization step.
typedef StepAction = FutureOr<void>? Function(InitializationProgress progress);

/// The initialization steps, which are executed in the order they are defined.
///
/// The [Dependencies] object is passed to each step, which allows the step to
/// set the dependency, and the next step to use it.
mixin InitializationSteps {
  /// The initialization steps,
  /// which are executed in the order they are defined.
  final initializationSteps = <String, StepAction>{
    'Global Dependencies': (progress) async {
      progress.dependencies.graphQLClient = GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(
          GraphQLEndpoint.baseUrl,
          defaultHeaders: {
            GraphQLEndpoint.headerStoreFrontAccessToken:
                GraphQLEndpoint.accessToken,
          },
        ),
      );
    },
    'Products Repository': (progress) async {
      final shopifyGraphQLClient = ShopifyGraphQLClient(
          graphQLClient: progress.dependencies.graphQLClient);
      final productsNetworkDataSource = ProductsNetworkDataProviderImpl(
          shopifyGraphQLClient: shopifyGraphQLClient);
      final productsRepository = ProductsRepositoryImpl(
          productsNetworkDataProvider: productsNetworkDataSource);
      progress.dependencies.productsRepository = productsRepository;
    },
    'Collections Repository': (progress) async {
      final shopifyGraphQLClient = ShopifyGraphQLClient(
          graphQLClient: progress.dependencies.graphQLClient);
      final collectionsNetworkDataSource = CollectionsNetworkDataProviderImpl(
          shopifyGraphQLClient: shopifyGraphQLClient);
      final collectionsRepository = CollectionsRepositoryImpl(
          collectionsNetworkDataProvider: collectionsNetworkDataSource);
      progress.dependencies.collectionsRepository = collectionsRepository;
    },
  };
}
