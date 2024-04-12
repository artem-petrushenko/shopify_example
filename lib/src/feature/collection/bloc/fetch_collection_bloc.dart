import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/collection/data/repository/collection_repository.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

part 'fetch_collection_event.dart';

part 'fetch_collection_state.dart';

part 'fetch_collection_bloc.freezed.dart';

class FetchCollectionBloc
    extends Bloc<FetchCollectionEvent, FetchCollectionState> {
  FetchCollectionBloc(
    this._collectionId, {
    required final CollectionRepository collectionRepository,
  })  : _collectionRepository = collectionRepository,
        super(const FetchCollectionState.initial()) {
    on<FetchCollectionEvent>(
      (event, emit) => event.map(
        fetchCollection: (event) => _onFetchCollection(event, emit),
      ),
    );
  }

  final String _collectionId;
  final CollectionRepository _collectionRepository;

  List<ProductModel> get _getCurrentProducts => state.maybeMap(
        loading: (state) => state.oldProducts,
        success: (state) => state.products,
        failure: (state) => state.oldProducts,
        orElse: () => [],
      );

  Future<void> _onFetchCollection(
    _FetchCollectionEvent event,
    Emitter<FetchCollectionState> emit,
  ) async {
    try {
      if (state is _Loading) {
        event.completer?.complete();
        return;
      }
      emit(_Loading(oldProducts: _getCurrentProducts));
      final products = await _collectionRepository.getCollectionProducts(
          collectionId: _collectionId);
      emit(_Success(products: products));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch collection products',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(
        message: 'Failed to fetch collection products',
        oldProducts: _getCurrentProducts,
      ));
    } finally {
      event.completer?.complete();
    }
  }
}
