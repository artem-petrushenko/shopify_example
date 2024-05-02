import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/cart/model/cart_item_model.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_checkout_widget.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_items_builder.dart';

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({
    super.key,
    required this.cartItems,
  });

  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: CartItemsBuilder(
              cartItems: cartItems,
            ),
          ),
          Column(
            children: [
              const CartCheckoutWidget(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Check out'),
              ),
            ],
          ),
        ],
      );
}
