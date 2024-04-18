import 'package:shopify_example/src/core/components/graphql_client/query_component/page_info.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/product.dart';

/// Query to get products
final String getProductsQuery = '''
  query(\$reverse : Boolean, \$query : String, \$first : Int, \$after : String){
    products(reverse: \$reverse, query: \$query, first: \$first, after: \$after) {
      nodes {
        $product
      }
      $pageInfo
    }
  }
''';
