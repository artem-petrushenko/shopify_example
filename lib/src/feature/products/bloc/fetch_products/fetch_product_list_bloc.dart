import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/products/data/repository/products_repository.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

part 'fetch_product_list_event.dart';

part 'fetch_product_list_state.dart';

part 'fetch_product_list_bloc.freezed.dart';

class FetchProductListBloc
    extends Bloc<FetchProductListEvent, FetchProductListState> {
  FetchProductListBloc({
    required final ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(const FetchProductListState.initial()) {
    on<FetchProductListEvent>(
      (event, emit) => event.map(
        fetchProductList: (event) => _onFetchProductList(event, emit),
      ),
    );
  }

  final ProductsRepository _productsRepository;

  List<ProductModel> get _getCurrentProducts => state.map(
        initial: (_) => [],
        loading: (state) => state.oldProducts,
        success: (state) => state.products,
        failure: (state) => state.oldProducts,
        empty: (state) => [],
      );

  Future<void> _onFetchProductList(
    _FetchProductListEvent event,
    Emitter<FetchProductListState> emit,
  ) async {
    try {
      if (state is _Loading) {
        event.completer?.complete();
        return;
      }
      emit(_Loading(oldProducts: _getCurrentProducts));
      final products = await _productsRepository.getProductList();
      emit(_Success(products: products));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch products',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(
        message: 'Failed to fetch products',
        oldProducts: _getCurrentProducts,
      ));
    } finally {
      event.completer?.complete();
    }
  }
}
