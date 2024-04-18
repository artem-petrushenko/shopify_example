import 'package:shopify_example/src/core/components/graphql_client/query_component/images.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/price_range.dart';

final String product = '''
    availableForSale
    createdAt
    handle
    id
    title
    $priceRange
    ${images(first: 1)}
''';
