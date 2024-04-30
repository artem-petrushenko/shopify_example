import 'package:shopify_example/src/core/components/graphql_client/graph_ql_client.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/mutation/cart_create.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/mutation/cart_lines_add.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/mutation/cart_lines_remote.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/mutation/cart_lines_update.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_cart_cost.dart';
import 'package:shopify_example/src/core/components/graphql_client/query/query/get_cart_items.dart';
import 'package:shopify_example/src/feature/cart/data/provider/remote/cart_network_data_provider.dart';
import 'package:shopify_example/src/feature/cart/model/cart_items_response_model.dart';
import 'package:shopify_example/src/feature/cart/model/cost/cart_cost_response_model.dart';
import 'package:shopify_example/src/feature/cart/model/create_cart_model.dart';

class CartNetworkDataProviderImpl implements CartNetworkDataProvider {
  const CartNetworkDataProviderImpl({
    required final ShopifyGraphQLClient shopifyGraphQLClient,
  }) : _shopifyGraphQLClient = shopifyGraphQLClient;

  final ShopifyGraphQLClient _shopifyGraphQLClient;

  @override
  Future<CreateCartModel> createCart() async {
    final response = await _shopifyGraphQLClient.mutate(
      document: cartCreateMutation,
    );
    return CreateCartModel.fromJson(response.data?['cartCreate'] ?? {});
  }

  @override
  Future<void> addProductToCart({
    required final String cartId,
    required final String productId,
    required final int quantity,
  }) async =>
      await _shopifyGraphQLClient.mutate(
        document: cartLinesAddMutation,
        variables: {
          'cartId': cartId,
          'merchandiseId': productId,
          'quantity': quantity,
        },
      );

  @override
  Future<void> removeProductFromCart({
    required final List<String> linesIds,
    required final String cartId,
  }) async =>
      await _shopifyGraphQLClient.mutate(
        document: cartLinesRemoteMutation,
        variables: {
          'cartId': cartId,
          'linesIds': linesIds,
        },
      );

  @override
  Future<CartItemsResponseModel> fetchCartItems({
    required final String cartId,
    final int first = 8,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getCartItemQuery,
      variables: {
        'id': cartId,
        'first': first,
      },
    );
    return CartItemsResponseModel.fromJson(response.data?['cart'] ?? {});
  }

  @override
  Future<void> updateProductInCart({
    required final String cartId,
    required final String lineId,
    required final int quantity,
  }) async =>
      await _shopifyGraphQLClient.mutate(
        document: cartLinesUpdateMutation,
        variables: {
          'cartId': cartId,
          'lineId': lineId,
          'quantity': quantity,
        },
      );

  @override
  Future<CartCostResponseModel> fetchCheckoutCart({
    required final String cartId,
  }) async {
    final response = await _shopifyGraphQLClient.query(
      document: getCartCostQuery,
      variables: {
        'id': cartId,
      },
    );
    return CartCostResponseModel.fromJson(response.data?['cart'] ?? {});
  }
}
