import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/routes/app_router.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';
import 'package:shopify_example/src/feature/products/widget/product_card.dart';

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
          onTap: () => Navigator.of(context).pushNamed(
            AppRouter.productDetails,
            arguments: products[index].id,
          ),
        ),
        itemCount: products.length,
      );
}
