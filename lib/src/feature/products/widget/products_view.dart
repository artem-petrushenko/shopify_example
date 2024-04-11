import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';
import 'package:shopify_example/src/feature/products/bloc/fetch_products/fetch_product_list_bloc.dart';
import 'package:shopify_example/src/feature/products/widget/product_list_builder.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (_) => FetchProductListBloc(
            productsRepository:
                DependenciesScope.of(context).productsRepository,
          )..add(const FetchProductListEvent.fetchProductList()),
          child: BlocConsumer<FetchProductListBloc, FetchProductListState>(
            listenWhen: (previous, current) => current.maybeMap(
              failure: (state) => state.oldProducts.isNotEmpty,
              orElse: () => false,
            ),
            listener: (BuildContext context, FetchProductListState state) =>
                state.mapOrNull(
              failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to fetch products')),
              ),
            ),
            builder: (BuildContext context, FetchProductListState state) =>
                RefreshIndicator(
              onRefresh: () async {
                final completer = Completer();
                context
                    .read<FetchProductListBloc>()
                    .add(FetchProductListEvent.fetchProductList(
                      completer: completer,
                    ));
                return completer.future;
              },
              child: state.maybeMap(
                success: (state) =>
                    ProductListBuilder(products: state.products),
                failure: (state) => state.oldProducts.isNotEmpty
                    ? ProductListBuilder(products: state.oldProducts)
                    : const Text('Failure'),
                empty: (_) => const Text('Empty'),
                loading: (state) => state.oldProducts.isNotEmpty
                    ? ProductListBuilder(products: state.oldProducts)
                    : const CircularProgressIndicator(),
                orElse: () => const CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      );
}
