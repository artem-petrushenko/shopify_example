import 'package:shopify_example/src/core/components/graphql_client/query_component/images.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/price_range.dart';

final String getCollection = '''
  query getCollection(\$collectionId: ID, \$first: Int, \$after: String) {
    collection(id: \$collectionId) {
      id
      handle
      title
      products(first: \$first, after: \$after) {
        nodes {
          handle  
          id
          title
          ${images(first: 10)}
          $priceRange
        }
      }
    }
''';
