import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/shared_preferences/shared_preferences_dao.dart';
import 'package:shopify_example/src/feature/auth/data/repository/authentication_repository.dart';
import 'package:shopify_example/src/feature/cart/data/repository/cart_repository.dart';
import 'package:shopify_example/src/feature/collection/data/repository/collection_repository.dart';
import 'package:shopify_example/src/feature/collections/data/repository/collections_repository.dart';
import 'package:shopify_example/src/feature/product_details/data/repository/products_repository.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  Dependencies();

  late final ShopifyGraphQLClient graphQLClient;
  late final ProductsRepository productsRepository;
  late final CollectionsRepository collectionsRepository;
  late final CollectionRepository collectionRepository;
  late final AuthenticationRepository authenticationRepository;
  late final SharedPreferencesDao preferencesDao;
  late final CartRepository cartRepository;
}

/// {@template initialization_result}
/// Result of initialization
/// {@endtemplate}
final class InitializationResult {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.dependencies,
    required this.stepCount,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of steps
  final int stepCount;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'stepCount: $stepCount, '
      'msSpent: $msSpent'
      ')';
}
