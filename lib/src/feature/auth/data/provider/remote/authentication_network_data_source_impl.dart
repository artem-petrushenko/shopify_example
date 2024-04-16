import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/mutation/customer_access_token_create.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_customer.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/authentication_network_data_source.dart';
import 'package:shopify_example/src/feature/auth/model/customer_access_token_model.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

final class AuthenticationNetworkDataSourceImpl
    implements AuthenticationNetworkDataSource {
  const AuthenticationNetworkDataSourceImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<CustomerModel> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  }) async {
    final customerAccessToken = await _createAccessToken(email, password);
    final response = await _shopifyGraphQLClient.query(
      document: getCustomerQuery,
      variables: {
        'customerAccessToken': customerAccessToken.accessToken,
      },
    );
    return AuthenticatedCustomerModel.fromJson(response.data?['customer'] ?? {});
  }

  Future<CustomerAccessTokenModel> _createAccessToken(
    String email,
    String password,
  ) async {
    final response = await _shopifyGraphQLClient.mutate(
      document: customerAccessTokenCreateMutation,
      variables: {
        'email': email,
        'password': password,
      },
    );
    return _extractAccessToken(response.data, "customerAccessTokenCreate");
  }

  CustomerAccessTokenModel _extractAccessToken(
    Map<String, dynamic>? mutationData,
    String mutation,
  ) =>
      CustomerAccessTokenModel.fromJson(
        mutationData?[mutation]['customerAccessToken'] ?? {},
      );
}
