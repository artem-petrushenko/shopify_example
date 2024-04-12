import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({
    super.key,
    required this.productDetails,
  });

  final ProductDetailsModel productDetails;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: Text('Max Price'),
                  subtitle: Text(
                    '${productDetails.priceRange.maxVariantPrice.amount} ${productDetails.priceRange.maxVariantPrice.currencyCode}',
                  ),
                ),
                ListTile(
                  title: Text('Min Price'),
                  subtitle: Text(
                      '${productDetails.priceRange.minVariantPrice.amount} ${productDetails.priceRange.minVariantPrice.currencyCode}'),
                ),
                ListTile(
                  title: Text('Description'),
                  subtitle: Text(productDetails.description),
                ),
              ],
            ),
          ),
        ],
      );
}
