import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/product_details/bloc/fetch_product_variant/fetch_product_variants_bloc.dart';
import 'package:shopify_example/src/feature/product_details/bloc/selecter_product_configuration/selector_product_configuration_cubit.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_price.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FetchProductVariantsBloc, FetchProductVariantsState>(
        builder: (BuildContext context, FetchProductVariantsState state) =>
            state.maybeMap(
          success: (state) => BlocBuilder<SelectorProductConfigurationCubit,
              SelectorProductConfigurationState>(
            builder: (context, selector) => ProductPrice(
              price: state.variants[selector.selectedIndex].price.formatPrice(),
              salePrice: state.variants[selector.selectedIndex].compareAtPrice
                  ?.formatPrice(),
            ),
          ),
          orElse: () => const SizedBox(),
        ),
      );
}
