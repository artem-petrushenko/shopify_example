import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: const Text('Product title'),
          subtitle: const Text('Product description'),
          trailing: const Text('Product price'),
        ),
      );
}
