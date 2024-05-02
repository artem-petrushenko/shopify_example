import 'dart:async';

import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/graph_ql_endpoint.dart';
import 'package:shopify_example/src/core/components/shared_preferences/shared_preferences_dao.dart';
import 'package:shopify_example/src/feature/auth/data/provider/local/session_storage_impl.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/authentication_network_data_source_impl.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/customer_network_data_source_impl.dart';
import 'package:shopify_example/src/feature/auth/data/repository/authentication_repository_impl.dart';
import 'package:shopify_example/src/feature/auth/data/repository/customer_repository_impl.dart';
import 'package:shopify_example/src/feature/cart/data/provider/local/cart_storage_impl.dart';
import 'package:shopify_example/src/feature/cart/data/provider/remote/cart_network_data_provider_impl.dart';
import 'package:shopify_example/src/feature/cart/data/repository/cart_repository_impl.dart';
import 'package:shopify_example/src/feature/collection/data/provider/remote/collection_network_data_provider_impl.dart';
import 'package:shopify_example/src/feature/collection/data/repository/collection_repository_impl.dart';
import 'package:shopify_example/src/feature/collections/data/provider/remote/collections_network_data_provider_impl.dart';
import 'package:shopify_example/src/feature/collections/data/repository/collections_repository_impl.dart';
import 'package:shopify_example/src/feature/initialization/model/initialization_proccess.dart';
import 'package:shopify_example/src/feature/product_details/data/provider/remote/products_network_data_provider_impl.dart';
import 'package:shopify_example/src/feature/product_details/data/repository/products_repository_impl.dart';

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
      final graphQLClient = GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(
          GraphQLEndpoint.baseUrl,
          defaultHeaders: {
            GraphQLEndpoint.headerStoreFrontAccessToken:
                GraphQLEndpoint.accessToken,
          },
        ),
      );
      progress.dependencies.graphQLClient = ShopifyGraphQLClient(
        graphQLClient: graphQLClient,
      );
      final sharedPreferences = await SharedPreferences.getInstance();
      progress.dependencies.preferencesDao =
          SharedPreferencesDao(sharedPreferences: sharedPreferences);
    },
    'Products Repository': (progress) async {
      final productsNetworkDataSource = ProductsNetworkDataProviderImpl(
          shopifyGraphQLClient: progress.dependencies.graphQLClient);
      final productsRepository = ProductsRepositoryImpl(
          productsNetworkDataProvider: productsNetworkDataSource);
      progress.dependencies.productsRepository = productsRepository;
    },
    'Collections Repository': (progress) async {
      final collectionsNetworkDataSource = CollectionsNetworkDataProviderImpl(
          shopifyGraphQLClient: progress.dependencies.graphQLClient);
      final collectionsRepository = CollectionsRepositoryImpl(
          collectionsNetworkDataProvider: collectionsNetworkDataSource);
      progress.dependencies.collectionsRepository = collectionsRepository;
    },
    'Collection Repository': (progress) async {
      final collectionNetworkDataSource = CollectionNetworkDataProviderImpl(
          shopifyGraphQLClient: progress.dependencies.graphQLClient);
      final collectionRepository = CollectionRepositoryImpl(
          collectionNetworkDataProvider: collectionNetworkDataSource);
      progress.dependencies.collectionRepository = collectionRepository;
    },
    'Authentication Repository': (progress) async {
      final authenticationNetworkDataSource =
          AuthenticationNetworkDataSourceImpl(
        shopifyGraphQLClient: progress.dependencies.graphQLClient,
      );
      final customerNetworkDataSource = CustomerNetworkDataSourceImpl(
        shopifyGraphQLClient: progress.dependencies.graphQLClient,
      );
      final authenticationRepository = AuthenticationRepositoryImpl(
        networkDataSource: authenticationNetworkDataSource,
        customerNetworkDataSource: customerNetworkDataSource,
        sessionStorage: SessionStorageImpl(
          sharedPreferences: progress.dependencies.preferencesDao,
        ),
      );
      progress.dependencies.authenticationRepository = authenticationRepository;
    },
    'Cart Repository': (progress) async {
      final cartNetworkDataSource = CartNetworkDataProviderImpl(
          shopifyGraphQLClient: progress.dependencies.graphQLClient);
      final cartStorage = CartStorageImpl(
        sharedPreferencesDao: progress.dependencies.preferencesDao,
      );
      final cartRepository = CartRepositoryImpl(
        cartNetworkDataProvider: cartNetworkDataSource,
        cartStorage: cartStorage,
      );
      progress.dependencies.cartRepository = cartRepository;
    },
    'Customer Repository': (progress) async {
      final customerNetworkDataSource = CustomerNetworkDataSourceImpl(
        shopifyGraphQLClient: progress.dependencies.graphQLClient,
      );
      final customerRepository = CustomerRepositoryImpl(
        customerNetworkDataSource: customerNetworkDataSource,
        sessionStorage: SessionStorageImpl(
          sharedPreferences: progress.dependencies.preferencesDao,
        ),
      );
      progress.dependencies.customerRepository = customerRepository;
    },
  };
}
