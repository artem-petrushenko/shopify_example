import 'package:shopify_example/src/core/components/graphql_client/query_component/cost.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/discount_allocations.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/product.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/selected_options.dart';

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
          $discountAllocations
          merchandise {
            ... on ProductVariant {
              id
              availableForSale
              $selectedOptions
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
