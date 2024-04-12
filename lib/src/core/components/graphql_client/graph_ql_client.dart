import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ShopifyGraphQLClient {
  const ShopifyGraphQLClient({
    required final GraphQLClient graphQLClient,
  }) : _graphQLClient = graphQLClient;

  final GraphQLClient _graphQLClient;

  Future<QueryResult> query({
    required final String document,
    final Map<String, dynamic> variables = const {},
  }) async =>
      await _graphQLClient.query(
        QueryOptions(
          document: gql(document),
          variables: variables,
        ),
      );

  Future<QueryResult> mutate({
    required final String document,
    final Map<String, dynamic> variables = const {},
  }) async =>
      await _graphQLClient.mutate(
        MutationOptions(
          document: gql(document),
          variables: variables,
        ),
      );
}
