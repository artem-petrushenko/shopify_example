import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';
import 'package:shopify_example/src/feature/product_details/bloc/fetch_product_variant/fetch_product_variants_bloc.dart';
import 'package:shopify_example/src/feature/product_details/bloc/selecter_product_configuration/selector_product_configuration_cubit.dart';
import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';
import 'package:shopify_example/src/feature/product_details/widget/add_to_cart_product_button.dart';
import 'package:shopify_example/src/feature/product_details/widget/image_carousel.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_configuration_selector.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_name.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_price_widget.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_recommendations_widget.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({
    super.key,
    required this.productDetails,
  });

  final ProductDetailsModel productDetails;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FetchProductVariantsBloc(
              productDetails.id,
              productsRepository: DependenciesScope.of(context).productsRepository,
            )..add(const FetchProductVariantsEvent.fetchProductVariants()),
          ),
          BlocProvider(
            create: (context) => SelectorProductConfigurationCubit(),
          ),
        ],
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ImageCarousel(
                    imagesUrls: productDetails.images.images
                        .map((image) => image.url)
                        .toList(),
                  ),
                  ProductName(productName: productDetails.title),
                  const ProductPriceWidget(),
                  Text(
                    'Tax included',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  ProductRecommendationsWidget(
                    productId: productDetails.id,
                  ),
                  BlocBuilder<FetchProductVariantsBloc,
                      FetchProductVariantsState>(
                    builder: (BuildContext context,
                            FetchProductVariantsState state) =>
                        state.maybeMap(
                      success: (configurationState) => configurationState
                                  .variants.length >
                              1
                          ? BlocBuilder<SelectorProductConfigurationCubit,
                              SelectorProductConfigurationState>(
                              builder: (context, state) =>
                                  ProductConfigurationSelector(
                                onPressed: (index) => context
                                    .read<SelectorProductConfigurationCubit>()
                                    .changeConfiguration(index),
                                variants: configurationState.variants,
                              ),
                            )
                          : const SizedBox(),
                      orElse: () => const SizedBox(),
                    ),
                  ),
                  BlocBuilder<FetchProductVariantsBloc,
                      FetchProductVariantsState>(
                    builder: (BuildContext context,
                            FetchProductVariantsState state) =>
                        state.maybeMap(
                      success: (configurationState) => BlocBuilder<
                          SelectorProductConfigurationCubit,
                          SelectorProductConfigurationState>(
                        builder: (BuildContext context,
                                SelectorProductConfigurationState state) =>
                            AddToCartProductButton(
                          merchandiseId: configurationState
                              .variants[state.selectedIndex].id,
                        ),
                      ),
                      orElse: () => const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
