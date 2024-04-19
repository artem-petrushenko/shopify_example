import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/common/routes/routes.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_recommendations_cart.dart';

class ProductRecommendationsListBuilder extends StatelessWidget {
  const ProductRecommendationsListBuilder({
    super.key,
    required this.products,
    this.height = 100.0,
  });

  final List<ProductModel> products;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ProductRecommendationsCart(
            title: products[index].title,
            onTap: () => context.push(
              Routes.productDetails,
              extra: products[index].id,
            ),
          ),
          itemCount: products.length,
        ),
      );
}
