import 'package:shopify_example/src/core/components/graphql_client/query_component/images.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/page_info.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/price_range.dart';

final String getCollectionQuery = '''
  query(\$collectionId: ID, \$first: Int, \$after: String, \$reverse: Boolean) {
    collection(id: \$collectionId) {
      id
      handle
      title
      products(first: \$first, after: \$after, reverse: \$reverse) {
        $pageInfo
        nodes {
          handle  
          id
          title
          ${images(first: 10)}
          $priceRange
        }
      }
    }
  }
''';
