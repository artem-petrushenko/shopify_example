import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_item_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CartItemList(),
        ),
      );
}
