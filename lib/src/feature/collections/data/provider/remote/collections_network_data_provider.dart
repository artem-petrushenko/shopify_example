import 'package:shopify_example/src/feature/collections/model/collection_model.dart';

abstract interface class CollectionsNetworkDataProvider {
  Future<List<CollectionModel>> getCategories({
    final bool reverse = false,
    final String? cursor,
  });
}
