import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/common/routes/routes.dart';
import 'package:shopify_example/src/feature/product_details/model/product_recommendations_model.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_recommendations_cart.dart';

class ProductRecommendationsList extends StatefulWidget {
  const ProductRecommendationsList({
    super.key,
    required this.products,
    this.height = 100.0,
  });

  final List<ProductRecommendationsModel> products;
  final double height;

  @override
  State<ProductRecommendationsList> createState() =>
      _ProductRecommendationsListState();
}

class _ProductRecommendationsListState
    extends State<ProductRecommendationsList> {
  final PageController _pageController = PageController(viewportFraction: 0.95);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: widget.height,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) =>
              ProductRecommendationsCart(
            title: widget.products[index].title,
            onTap: () => context.push(
              Routes.productDetails,
              extra: widget.products[index].id,
            ),
            merchandiseId: widget.products[index].id,
            imageUrl: widget.products[index].images.images.first.url,
            price:
                '${widget.products[index].variants.variants.first.price.formattedPriceWithLocale()} ${widget.products[index].variants.variants.first.price.currencyCode}',
            compareAtPrice: widget.products[index].variants.variants.first
                        .compareAtPrice !=
                    null
                ? '${widget.products[index].variants.variants.first.compareAtPrice!.formattedPriceWithLocale()} ${widget.products[index].variants.variants.first.compareAtPrice!.currencyCode}'
                : null,
          ),
        ),
      );
}
