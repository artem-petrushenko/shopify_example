import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/dropdown/default_dropdown.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_model.dart';

class ProductConfigurationSelector extends StatelessWidget {
  const ProductConfigurationSelector({
    super.key,
    required this.onPressed,
    required this.variants,
  });

  final Function(int index) onPressed;
  final List<ProductVariantModel> variants;

  @override
  Widget build(BuildContext context) => DefaultDropdown(
        dropdownMenuEntries: variants.map((value) {
          return DropdownMenuEntry(value: value.id, label: value.title);
        }).toList(),
        onPressed: onPressed,
      );
}
