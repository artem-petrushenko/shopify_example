import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/collections/bloc/fetch_collections/fetch_collections_bloc.dart';
import 'package:shopify_example/src/feature/collections/widget/collection_list_builder.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class CollectionListView extends StatelessWidget {
  const CollectionListView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Collections'),
        ),
        body: BlocProvider(
          create: (_) => FetchCollectionsBloc(
            collectionsRepository:
                DependenciesScope.of(context).collectionsRepository,
          )..add(const FetchCollectionsEvent.fetchCollections()),
          child: BlocConsumer<FetchCollectionsBloc, FetchCollectionsState>(
            listenWhen: (previous, current) => current.maybeMap(
              failure: (state) => state.oldCollections.isNotEmpty,
              orElse: () => false,
            ),
            listener: (BuildContext context, FetchCollectionsState state) =>
                state.mapOrNull(
              failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              ),
            ),
            builder: (BuildContext context, FetchCollectionsState state) =>
                RefreshIndicator(
              onRefresh: () async {
                final completer = Completer();
                context
                    .read<FetchCollectionsBloc>()
                    .add(FetchCollectionsEvent.fetchCollections(
                      completer: completer,
                    ));
                return completer.future;
              },
              child: Center(
                child: state.maybeMap(
                  loading: (state) => state.oldCollections.isEmpty
                      ? const CircularProgressIndicator()
                      : CollectionListBuilder(
                          collections: state.oldCollections),
                  success: (state) =>
                      CollectionListBuilder(collections: state.collections),
                  empty: (_) => const Text('No collections'),
                  failure: (state) => state.oldCollections.isEmpty
                      ? const Text('Failed to load collections')
                      : CollectionListBuilder(
                          collections: state.oldCollections),
                  orElse: () => const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ),
      );
}
