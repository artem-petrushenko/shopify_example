import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_model.dart';

class ProductConfigurationSelector extends StatelessWidget {
  const ProductConfigurationSelector({
    super.key,
    required this.selectedIndex,
    required this.onPressed,
    required this.variants,
    this.height = 90.0,
  });

  final double height;
  final int selectedIndex;
  final Function(int index) onPressed;
  final List<ProductVariantModel> variants;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: variants.length,
          itemBuilder: (BuildContext context, int index) => ElevatedButton(
            onPressed: () => onPressed(index),
            child: Text(variants[index].id),
          ),
        ),
      );
}
