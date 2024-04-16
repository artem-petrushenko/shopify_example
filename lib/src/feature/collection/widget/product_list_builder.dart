import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/common/routes/routes.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';
import 'package:shopify_example/src/feature/collection/widget/product_card.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(
          product: products[index],
          onTap: () => context.push(
            Routes.productDetails,
            extra: products[index].id,
          ),
        ),
        itemCount: products.length,
      );
}
