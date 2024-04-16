import 'package:shopify_example/src/core/components/graphql_client/query_component/customer_access_token.dart';

const String customerAccessTokenCreateMutation = '''
  mutation customerAccessTokenCreate(\$email : String!, \$password: String!) {
    customerAccessTokenCreate(input: {email: \$email, password: \$password}) {
        $customerAccessToken
    }
  }
''';
