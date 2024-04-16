import 'package:shopify_example/src/core/components/graphql_client/query_component/image.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/page_info.dart';

/// Query to get collections
final String getCollectionsQuery = '''
  query(\$after : String, \$reverse : Boolean, \$first : Int){
    collections(first: \$first, reverse: \$reverse, after: \$after) {
      nodes {
        id
        handle
        title
        updatedAt
        ${image()}
      }
      $pageInfo
      totalCount
    }
  }
''';
