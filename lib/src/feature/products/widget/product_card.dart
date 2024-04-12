import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  final ProductModel product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: onTap,
          title: Text(product.title),
          subtitle: const Text('Product description'),
          trailing: Text(
              '${product.priceRange.maxVariantPrice.amount} ${product.priceRange.maxVariantPrice.currencyCode}'),
        ),
      );
}
