import 'package:shopify_example/src/core/components/graphql_client/query_component/product_variants.dart';

/// Query to get product variant
final String getProductVariantQuery = '''
  query(\$id: ID, \$productFirst: Int) {
    product(id: \$id) {
      $productVariant
    }
  }
''';
