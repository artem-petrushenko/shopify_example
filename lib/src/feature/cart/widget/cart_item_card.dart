import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/cart/model/discount_allocations_model.dart';
import 'package:shopify_example/src/feature/cart/model/selected_options_model.dart';
import 'package:shopify_example/src/feature/cart/widget/discount_widget.dart';

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
    required this.discounts,
    required this.isAvailableForSale,
  });

  final String itemName;
  final String itemPrice;
  final int itemQuantity;
  final VoidCallback onDeletePressed;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;
  final List<SelectedOptionsModel> selectedOptions;
  final List<DiscountAllocationsModel> discounts;
  final bool isAvailableForSale;

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
                if (_discountsList.isNotEmpty)
                  DiscountWidget(discounts: _discountsList),
                Text(isAvailableForSale ? 'Available' : 'Unavailable'),
                Wrap(
                    children: selectedOptions
                        .map((option) => Chip(
                            label: Text('${option.name}: ${option.value}')))
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

  String _discountValue(DiscountAllocationsModel discount) =>
      '${discount.title} (-${discount.discountedAmount.formattedPriceWithLocale()})';

  List<String> get _discountsList => discounts
      .where((element) => double.tryParse(element.discountedAmount.amount) != 0)
      .map((e) => _discountValue(e))
      .toList();
}
