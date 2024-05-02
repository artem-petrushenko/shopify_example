import 'package:shopify_example/src/core/components/graphql_client/query_component/address.dart';

const String getCustomerAddressesQuery = '''
  query(\$first: Int, \$customerAccessToken: String!, \$after: String) {
    customer(customerAccessToken: \$customerAccessToken) {
      addresses(first: \$first, after: \$after) {
        nodes {
          $address
        }
      }
    } 
  }
''';
