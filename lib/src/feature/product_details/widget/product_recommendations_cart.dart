import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/widget/image/network/cached_network_images_widget.dart';
import 'package:shopify_example/src/common/widget/ink_well/no_splash_ink_well.dart';
import 'package:shopify_example/src/feature/cart/bloc/changed_cart/changed_cart_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_price.dart';

class ProductRecommendationsCart extends StatelessWidget {
  const ProductRecommendationsCart({
    super.key,
    required this.title,
    required this.onTap,
    required this.merchandiseId,
    required this.imageUrl,
    this.height = 100.0,
    required this.price,
    this.compareAtPrice,
  });

  final String title;
  final VoidCallback onTap;
  final String imageUrl;
  final String merchandiseId;
  final double height;
  final String price;
  final String? compareAtPrice;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ChangedCartBloc(
            cartRepository: DependenciesScope.of(context).cartRepository),
        child: NoSplashInkWell(
          onTap: onTap,
          child: Row(
            children: [
              CachedNetworkImagesWidget(
                imageUrl: imageUrl,
                width: 100.0,
                height: 100.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductPrice(
                            price: price,
                            salePrice: compareAtPrice,
                          ),
                          BlocBuilder<ChangedCartBloc, ChangedCartState>(
                            builder: (context, state) => ElevatedButton(
                              onPressed: () =>
                                  context.read<ChangedCartBloc>().add(
                                        ChangedCartEvent.addItemToCart(
                                          itemId: merchandiseId,
                                        ),
                                      ),
                              child: state.maybeMap(
                                loading: (state) =>
                                    const CircularProgressIndicator(),
                                failure: (state) =>
                                    const Icon(Icons.cancel_outlined),
                                success: (state) =>
                                    const Icon(Icons.check_circle_outlined),
                                orElse: () => const Icon(
                                    Icons.add_shopping_cart_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
