import 'package:graphql/client.dart';
import 'package:shopify_example/src/feature/collections/data/repository/collections_repository.dart';
import 'package:shopify_example/src/feature/products/data/repository/products_repository.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  Dependencies();

  late final GraphQLClient graphQLClient;
  late final ProductsRepository productsRepository;
  late final CollectionsRepository collectionsRepository;
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
