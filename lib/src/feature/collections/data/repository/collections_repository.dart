import 'package:shopify_example/src/feature/collections/model/collection_model.dart';

abstract interface class CollectionsRepository {
  Future<List<CollectionModel>> getCategories({
    final String? cursor,
  });
}
