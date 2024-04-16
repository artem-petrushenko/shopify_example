import 'package:shopify_example/src/core/components/graphql_client/query_component/collections.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/images.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/price_range.dart';

/// Query to get product
final String getProductDetailsQuery = '''
  query(\$id: ID) {
    product(id: \$id) {
      createdAt
      description
      handle
      id
      isGiftCard
      onlineStoreUrl
      productType
      publishedAt
      requiresSellingPlan
      tags
      title
      trackingParameters
      updatedAt
      $priceRange
      ${images(first: 10)}
      ${collections(first: 10)}
    }
  }
''';
