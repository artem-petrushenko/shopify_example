import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/cart/model/selected_options_model.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.onDeletePressed,
    required this.onMinusPressed,
    required this.onPlusPressed,
    required this.selectedOptions,
  });

  final String itemName;
  final String itemPrice;
  final int itemQuantity;
  final VoidCallback onDeletePressed;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;
  final List<SelectedOptionsModel> selectedOptions;

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
                Wrap(
                    children: selectedOptions
                        .map((option) =>
                            Chip(label: Text('${option.name}: ${option.value}')))
                        .toList()),
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
