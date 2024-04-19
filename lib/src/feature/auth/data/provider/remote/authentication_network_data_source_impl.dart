import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/mutation/customer_access_token_create.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/mutation/customer_access_token_delete.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/authentication_network_data_source.dart';
import 'package:shopify_example/src/feature/auth/model/customer_access_token_model.dart';

final class AuthenticationNetworkDataSourceImpl
    implements AuthenticationNetworkDataSource {
  const AuthenticationNetworkDataSourceImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<CustomerAccessTokenModel> createAccessToken({
    required final String email,
    required final String password,
  }) async {
    final response = await _shopifyGraphQLClient.mutate(
      document: customerAccessTokenCreateMutation,
      variables: {
        'email': email,
        'password': password,
      },
    );
    return _extractAccessToken(response.data, "customerAccessTokenCreate");
  }

  @override
  Future<void> logOut({
    required final String customerAccessToken,
  }) async {
    await _shopifyGraphQLClient
        .mutate(document: customerAccessTokenDeleteMutation, variables: {
      'customerAccessToken': customerAccessToken,
    });
  }

  CustomerAccessTokenModel _extractAccessToken(
    Map<String, dynamic>? mutationData,
    String mutation,
  ) =>
      CustomerAccessTokenModel.fromJson(
        mutationData?[mutation]['customerAccessToken'] ?? {},
      );
}
