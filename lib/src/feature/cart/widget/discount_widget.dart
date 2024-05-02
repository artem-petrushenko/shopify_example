import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key,
    required this.discounts,
  });

  final List<String> discounts;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.discount_outlined),
          Expanded(
            child: Column(
              children: discounts.map((e) => Text(e)).toList(),
            ),
          ),
        ],
      );
}
