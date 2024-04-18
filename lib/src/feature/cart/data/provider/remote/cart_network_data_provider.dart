import 'package:shopify_example/src/feature/cart/model/cart_items_response_model.dart';
import 'package:shopify_example/src/feature/cart/model/create_cart_model.dart';

abstract interface class CartNetworkDataProvider {
  Future<CreateCartModel> createCart();

  Future<void> addProductToCart({
    required final String cartId,
    required final String productId,
    required final int quantity,
  });

  Future<void> removeProductFromCart({
    required final List<String> linesIds,
    required final String cartId,
  });

  Future<CartItemsResponseModel> fetchCartItems({
    required final String cartId,
    final int first = 8,
  });
}
