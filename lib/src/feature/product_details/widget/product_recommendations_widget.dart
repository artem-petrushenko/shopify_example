import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/widget/progress_indicator/default_circular_progress_indicator.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';
import 'package:shopify_example/src/feature/product_details/bloc/fetch_product_recommendations/fetch_product_recommendations_bloc.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_recommendations_list_builder.dart';

class ProductRecommendationsWidget extends StatelessWidget {
  const ProductRecommendationsWidget({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) =>
      BlocProvider<FetchProductRecommendationsBloc>(
        create: (BuildContext context) => FetchProductRecommendationsBloc(
          productId,
          productsRepository: DependenciesScope.of(context).productsRepository,
        )..add(const FetchProductRecommendationsEvent
            .fetchProductRecommendations()),
        child: BlocBuilder<FetchProductRecommendationsBloc,
            FetchProductRecommendationsState>(
          builder:
              (BuildContext context, FetchProductRecommendationsState state) =>
                  state.maybeMap(
            loading: (_) => const DefaultCircularProgressIndicator(),
            success: (state) => ProductRecommendationsList(
              products: state.products,
            ),
            failure: (_) => const SizedBox.shrink(),
            orElse: () => const DefaultCircularProgressIndicator(),
          ),
        ),
      );
}
