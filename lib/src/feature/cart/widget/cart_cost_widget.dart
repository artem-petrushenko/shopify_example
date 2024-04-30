import 'package:flutter/material.dart';

class CartCostWidget extends StatelessWidget {
  const CartCostWidget({
    super.key,
    required this.estimatedSubtotal,
  });

  final String estimatedSubtotal;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Estimated subtotal'),
              Text(estimatedSubtotal),
            ],
          ),
          const Text(
            'Tax included and shipping and discounts calculated at checkout',
          ),
        ],
      );
}
