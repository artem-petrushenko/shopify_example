import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

abstract interface class CollectionNetworkDataProvider {
  Future<List<ProductModel>> getCollectionProducts({
    required final String collectionId,
    final String? after,
    final int first = 10,
    final reverse = false,
  });
}
