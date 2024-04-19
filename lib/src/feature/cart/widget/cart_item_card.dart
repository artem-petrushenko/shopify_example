import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.onDeletePressed,
    required this.onMinusPressed,
    required this.onPlusPressed,
  });

  final String itemName;
  final String itemPrice;
  final int itemQuantity;
  final VoidCallback onDeletePressed;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName),
                Text(itemPrice),
                Text(itemQuantity.toString()),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDeletePressed,
          ),
          IconButton(
            onPressed: onPlusPressed,
            icon: const Icon(Icons.plus_one),
          ),
          IconButton(
            onPressed: onMinusPressed,
            icon: const Icon(Icons.exposure_minus_1),
          ),
        ],
      );
}
