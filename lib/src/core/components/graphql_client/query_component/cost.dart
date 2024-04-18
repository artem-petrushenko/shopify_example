import 'package:shopify_example/src/core/components/graphql_client/query_component/subtotal_amount.dart';
import 'package:shopify_example/src/core/components/graphql_client/query_component/total_amount.dart';

import 'amount_per_quantity.dart';
import 'compare_at_amount_per_quantity.dart';

const String cost = '''
  cost {
    $amountPerQuantity
    $compareAtAmountPerQuantity
    $subtotalAmount
    $totalAmount
  }
''';
