import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';
import 'package:shopify_example/src/feature/product_details/bloc/fetch_product_variant/fetch_product_variants_bloc.dart';
import 'package:shopify_example/src/feature/product_details/bloc/selecter_product_configuration/selector_product_configuration_cubit.dart';
import 'package:shopify_example/src/feature/product_details/model/product_details_model.dart';
import 'package:shopify_example/src/feature/product_details/widget/add_to_cart_product_button.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_configuration_selector.dart';
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
              productsRepository:
                  DependenciesScope.of(context).productsRepository,
            )..add(const FetchProductVariantsEvent.fetchProductVariants()),
          ),
          BlocProvider(
            create: (context) => SelectorProductConfigurationCubit(),
          ),
        ],
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
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
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ProductRecommendationsWidget(
                      productId: productDetails.id,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<FetchProductVariantsBloc,
                        FetchProductVariantsState>(
                      builder: (BuildContext context,
                              FetchProductVariantsState state) =>
                          state.maybeMap(
                        success: (configurationState) => BlocBuilder<
                            SelectorProductConfigurationCubit,
                            SelectorProductConfigurationState>(
                          builder: (context, state) =>
                              ProductConfigurationSelector(
                            selectedIndex: state.selectedIndex,
                            onPressed: (index) => context
                                .read<SelectorProductConfigurationCubit>()
                                .changeConfiguration(index),
                            variants: configurationState.variants,
                          ),
                        ),
                        orElse: () => const SizedBox(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<FetchProductVariantsBloc, FetchProductVariantsState>(
              builder:
                  (BuildContext context, FetchProductVariantsState state) =>
                      state.maybeMap(
                success: (configurationState) => BlocBuilder<
                    SelectorProductConfigurationCubit,
                    SelectorProductConfigurationState>(
                  builder: (BuildContext context,
                          SelectorProductConfigurationState state) =>
                      AddToCartProductButton(
                    merchandiseId:
                        configurationState.variants[state.selectedIndex].id,
                  ),
                ),
                orElse: () => const SizedBox(),
              ),
            ),
          ],
        ),
      );
}
