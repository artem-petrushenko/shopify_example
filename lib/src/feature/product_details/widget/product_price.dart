import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/product_details/widget/sale_chip.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    this.salePrice,
  });

  final String price;
  final String? salePrice;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (salePrice != null)
                    Text(
                      salePrice!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),

              if (salePrice != null) const SaleChip(),
            ],
          ),
          Text(
            'Tax included',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      );
}
