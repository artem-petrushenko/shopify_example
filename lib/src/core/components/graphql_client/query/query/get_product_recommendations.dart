import 'package:shopify_example/src/core/components/graphql_client/query_component/product.dart';

final String getProductRecommendationsQuery = '''
  query(\$productId: ID!){
    productRecommendations(productId: \$productId) {
      $product
    }
  }
''';
