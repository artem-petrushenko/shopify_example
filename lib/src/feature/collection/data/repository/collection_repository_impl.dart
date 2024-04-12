import 'package:shopify_example/src/feature/collection/data/provider/remote/collection_network_data_provider.dart';
import 'package:shopify_example/src/feature/collection/data/repository/collection_repository.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  const CollectionRepositoryImpl({
    required final CollectionNetworkDataProvider collectionNetworkDataProvider,
  }) : _collectionNetworkDataProvider = collectionNetworkDataProvider;

  final CollectionNetworkDataProvider _collectionNetworkDataProvider;

  @override
  Future<List<ProductModel>> getCollectionProducts({
    required final String collectionId,
    final String? after,
    final int first = 10,
    final reverse = false,
  }) async {
    return await _collectionNetworkDataProvider.getCollectionProducts(
      collectionId: collectionId,
      after: after,
      first: first,
      reverse: reverse,
    );
  }
}
