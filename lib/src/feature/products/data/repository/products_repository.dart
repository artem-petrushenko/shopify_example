import 'package:shopify_example/src/feature/products/model/product_model.dart';

abstract interface class ProductsRepository {
  Future<List<ProductModel>> getProductList();
}
