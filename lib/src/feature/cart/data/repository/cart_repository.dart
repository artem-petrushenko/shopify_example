import 'package:shopify_example/src/feature/cart/model/cart_items_response_model.dart';

abstract interface class CartRepository {
  Future<String> fetchCartId();

  Future<void> addProductToCart({
    required final String cartId,
    required final String productId,
    required final int quantity,
  });

  Future<CartItemsResponseModel> fetchCartItems({
    required final String cartId,
    final int first = 8,
  });
}
