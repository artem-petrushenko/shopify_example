import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/cart/model/cart_item_model.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_item_card.dart';

class CartItemsBuilder extends StatelessWidget {
  const CartItemsBuilder({
    super.key,
    required this.cartItems,
  });

  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (BuildContext context, int index) => CartItemCard(
          itemName: cartItems[index].merchandise.product.title,
          itemPrice: cartItems[index].cost.totalAmount.amount,
          itemQuantity: cartItems[index].quantity,
        ),
        itemCount: cartItems.length,
      );
}
