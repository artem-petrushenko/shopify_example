import 'package:shopify_example/src/core/components/graphql_client/query_component/address.dart';

const String getCustomerDefaultAddressQuery = '''
  query(\$customerAccessToken: String!){
    customer(customerAccessToken: \$customerAccessToken) {
      defaultAddress {
        $address
      }
    }
  }
''';
