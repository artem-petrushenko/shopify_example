import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/widget/refresh_indicator/default_refresh_indicator.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';
import 'package:shopify_example/src/feature/product_details/bloc/fetch_product_details/fetch_product_details_bloc.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_details_content.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => FetchProductDetailsBloc(
          id,
          productsRepository: DependenciesScope.of(context).productsRepository,
        )..add(const FetchProductDetailsEvent.fetchProductDetails()),
        child: Scaffold(
          body: BlocConsumer<FetchProductDetailsBloc, FetchProductDetailsState>(
            listenWhen: (previous, current) => current.maybeMap(
              failure: (state) => state.oldProductDetails != null,
              orElse: () => false,
            ),
            listener: (BuildContext context, FetchProductDetailsState state) =>
                state.mapOrNull(
              failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Failed to fetch product details')),
              ),
            ),
            builder: (BuildContext context, FetchProductDetailsState state) =>
                DefaultRefreshIndicator(
              onRefresh: (completer) => context
                  .read<FetchProductDetailsBloc>()
                  .add(FetchProductDetailsEvent.fetchProductDetails(
                      completer: completer)),
              child: Center(
                child: state.maybeMap(
                  loading: (state) => state.oldProductDetails != null
                      ? ProductDetailsContent(
                          productDetails: state.oldProductDetails!)
                      : const CircularProgressIndicator(),
                  success: (state) => ProductDetailsContent(
                    productDetails: state.productDetails,
                  ),
                  failure: (state) => state.oldProductDetails != null
                      ? ProductDetailsContent(
                          productDetails: state.oldProductDetails!)
                      : const Text('Failure'),
                  orElse: () => const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ),
      );
}
