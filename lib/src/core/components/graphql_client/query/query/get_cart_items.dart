import 'package:shopify_example/src/core/components/graphql_client/query_component/cost.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/product.dart';

final String getCartItemQuery = '''
  query(\$id: ID!, \$first: Int) {
    cart(id: \$id) {
      id
      totalQuantity
      lines(first: \$first) {
        nodes {
          quantity
          id
          $cost
          merchandise {
            ... on ProductVariant {
              id
              product {
                $product
              }
            }
          }
        }
      }
    }
  }
''';
