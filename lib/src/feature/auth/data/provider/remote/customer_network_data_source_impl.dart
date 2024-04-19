import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_customer.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/customer_network_data_source.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

class CustomerNetworkDataSourceImpl implements CustomerNetworkDataSource {
  const CustomerNetworkDataSourceImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<CustomerModel> getCustomer({
    required final String customerAccessToken,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getCustomerQuery,
      variables: {
        'customerAccessToken': customerAccessToken,
      },
    );
    return AuthenticatedCustomerModel.fromJson(response.data?['customer'] ?? {});
  }
}
