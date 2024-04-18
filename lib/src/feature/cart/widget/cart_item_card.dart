import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
  });

  final String itemName;
  final String itemPrice;
  final int itemQuantity;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(itemName),
          Text(itemPrice),
          Text(itemQuantity.toString()),
        ],
      );
}
