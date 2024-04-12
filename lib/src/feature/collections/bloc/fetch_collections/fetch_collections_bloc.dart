import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/collections/data/repository/collections_repository.dart';
import 'package:shopify_example/src/feature/products/model/collection_model.dart';

part 'fetch_collections_event.dart';

part 'fetch_collections_state.dart';

part 'fetch_collections_bloc.freezed.dart';

class FetchCollectionsBloc
    extends Bloc<FetchCollectionsEvent, FetchCollectionsState> {
  FetchCollectionsBloc({
    required final CollectionsRepository collectionsRepository,
  })  : _collectionsRepository = collectionsRepository,
        super(const _Initial()) {
    on<FetchCollectionsEvent>(
      (event, emit) => event.map(
        fetchCollections: (event) => _onFetchCollections(event, emit),
      ),
    );
  }

  final CollectionsRepository _collectionsRepository;

  List<CollectionModel> get _getCurrentCollections => state.maybeMap(
        loading: (state) => state.oldCollections,
        success: (state) => state.collections,
        failure: (state) => state.oldCollections,
        orElse: () => [],
      );

  Future<void> _onFetchCollections(
    _FetchCollections event,
    Emitter<FetchCollectionsState> emit,
  ) async {
    if (state is _Loading) {
      event.completer?.complete();
      return;
    }
    try {
      emit(_Loading(oldCollections: _getCurrentCollections));
      final collections = await _collectionsRepository.getCategories();
      emit(_Success(collections: collections));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch collections',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(
        message: error.toString(),
        oldCollections: _getCurrentCollections,
      ));
    } finally {
      event.completer?.complete();
    }
  }
}
