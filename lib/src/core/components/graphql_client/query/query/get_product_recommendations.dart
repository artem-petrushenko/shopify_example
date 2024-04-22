import 'package:shopify_example/src/core/components/graphql_client/query_component/product.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/product_variants.dart';

final String getProductRecommendationsQuery = '''
  query(\$productId: ID!, \$productFirst: Int){
    productRecommendations(productId: \$productId) {
      $product
      $productVariant
    }
  }
''';
