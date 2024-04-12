import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/widget/refresh_indicator/default_refresh_indicator.dart';
import 'package:shopify_example/src/feature/collection/bloc/fetch_collection_bloc.dart';
import 'package:shopify_example/src/feature/collection/widget/product_list_builder.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class CollectionDetailsView extends StatelessWidget {
  const CollectionDetailsView({
    super.key,
    required this.collectionId,
  });

  final String collectionId;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (_) => FetchCollectionBloc(
            collectionId,
            collectionRepository:
                DependenciesScope.of(context).collectionRepository,
          )..add(const FetchCollectionEvent.fetchCollection()),
          child: BlocConsumer<FetchCollectionBloc, FetchCollectionState>(
            listenWhen: (previous, current) => current.maybeMap(
              failure: (state) => state.oldProducts.isNotEmpty,
              orElse: () => false,
            ),
            listener: (BuildContext context, FetchCollectionState state) =>
                state.mapOrNull(
              failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to fetch products')),
              ),
            ),
            builder: (BuildContext context, FetchCollectionState state) =>
                DefaultRefreshIndicator(
              onRefresh: (completer) async {
                context
                    .read<FetchCollectionBloc>()
                    .add(FetchCollectionEvent.fetchCollection(
                      completer: completer,
                    ));
              },
              child: Center(
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
        ),
      );
}
