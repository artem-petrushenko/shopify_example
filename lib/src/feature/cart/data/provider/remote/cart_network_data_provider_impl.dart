import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/feature/cart/data/provider/remote/cart_network_data_provider.dart';

class CartNetworkDataProviderImpl implements CartNetworkDataProvider {
  const CartNetworkDataProviderImpl({
    required final ShopifyGraphQLClient client,
  }) : _client = client;

  final ShopifyGraphQLClient _client;
}
