import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_customer.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_customer_addresses.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_customer_default_address.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/customer_network_data_source.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_list_model.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_model.dart';

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
    return AuthenticatedCustomerModel.fromJson(
        response.data?['customer'] ?? {});
  }

  @override
  Future<MailingAddressListModel> getCustomerAddresses({
    required final String customerAccessToken,
    required final int first,
    final String? after,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getCustomerAddressesQuery,
      variables: {
        'customerAccessToken': customerAccessToken,
        'first': first,
        'after': after,
      },
    );
    return MailingAddressListModel.fromJson(
        response.data?['customer']['addresses'] ?? {});
  }

  @override
  Future<MailingAddressModel> getCustomerDefaultAddress({
    required final String customerAccessToken,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getCustomerDefaultAddressQuery,
      variables: {
        'customerAccessToken': customerAccessToken,
      },
    );
    return MailingAddressModel.fromJson(
        response.data?['customer']['defaultAddress'] ?? {});
  }
}
