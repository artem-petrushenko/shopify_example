import 'package:shopify_example/src/feature/cart/data/provider/local/cart_storage.dart';
import 'package:shopify_example/src/feature/cart/data/provider/remote/cart_network_data_provider.dart';
import 'package:shopify_example/src/feature/cart/data/repository/cart_repository.dart';
import 'package:shopify_example/src/feature/cart/model/cart_items_response_model.dart';

class CartRepositoryImpl implements CartRepository {
  const CartRepositoryImpl({
    required final CartNetworkDataProvider cartNetworkDataProvider,
    required final CartStorage cartStorage,
  })  : _cartNetworkDataProvider = cartNetworkDataProvider,
        _cartStorage = cartStorage;

  final CartNetworkDataProvider _cartNetworkDataProvider;
  final CartStorage _cartStorage;

  Future<String> _fetchCartId() async {
    final cartId = _cartStorage.getCartId();
    if (cartId == null || cartId.isEmpty) {
      final cart = await _cartNetworkDataProvider.createCart();
      await _cartStorage.addCartId(cart.cart.id);
      return cart.cart.id;
    }
    return cartId;
  }

  @override
  Future<void> addProductToCart({
    required final String productId,
    required final int quantity,
  }) async {
    final cartId = await _fetchCartId();
    await _cartNetworkDataProvider.addProductToCart(
      cartId: cartId,
      productId: productId,
      quantity: quantity,
    );
  }

  @override
  Future<void> removeProductFromCart({
    required final List<String> linesIds,
  }) async {
    final cartId = await _fetchCartId();
    await _cartNetworkDataProvider.removeProductFromCart(
      linesIds: linesIds,
      cartId: cartId,
    );
  }

  @override
  Future<CartItemsResponseModel> fetchCartItems({
    final int first = 8,
  }) async {
    final cartId = await _fetchCartId();
    return await _cartNetworkDataProvider.fetchCartItems(
      cartId: cartId,
      first: first,
    );
  }

  @override
  Future<void> updateProductInCart({
    required final String lineId,
    required final int quantity,
  }) async {
    final cartId = await _fetchCartId();
    await _cartNetworkDataProvider.updateProductInCart(
      cartId: cartId,
      lineId: lineId,
      quantity: quantity,
    );
  }
}
