import 'package:shopify_example/src/feature/cart/model/cart_items_response_model.dart';
import 'package:shopify_example/src/feature/cart/model/cost/cart_cost_response_model.dart';

abstract interface class CartRepository {
  Future<void> addProductToCart({
    required final String productId,
    required final int quantity,
  });

  Future<void> removeProductFromCart({
    required final List<String> linesIds,
  });

  Future<CartItemsResponseModel> fetchCartItems({
    final int first = 8,
  });

  Future<void> updateProductInCart({
    required final String lineId,
    required final int quantity,
  });

  Future<CartCostResponseModel> fetchCheckoutCart();
}
