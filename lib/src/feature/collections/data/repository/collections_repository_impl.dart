import 'package:shopify_example/src/feature/collections/data/provider/remote/collections_network_data_provider.dart';
import 'package:shopify_example/src/feature/collections/data/repository/collections_repository.dart';
import 'package:shopify_example/src/feature/products/model/collection_model.dart';

class CollectionsRepositoryImpl implements CollectionsRepository {
  const CollectionsRepositoryImpl({
    required final CollectionsNetworkDataProvider
        collectionsNetworkDataProvider,
  }) : _collectionsNetworkDataProvider = collectionsNetworkDataProvider;

  final CollectionsNetworkDataProvider _collectionsNetworkDataProvider;

  @override
  Future<List<CollectionModel>> getCategories({
    final String? cursor,
  }) async =>
      await _collectionsNetworkDataProvider.getCategories(
        cursor: cursor,
        first: 8,
      );
}
