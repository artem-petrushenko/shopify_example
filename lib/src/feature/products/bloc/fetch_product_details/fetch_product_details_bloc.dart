import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/products/data/repository/products_repository.dart';
import 'package:shopify_example/src/feature/products/model/product_details_model.dart';

part 'fetch_product_details_event.dart';

part 'fetch_product_details_state.dart';

part 'fetch_product_details_bloc.freezed.dart';

class FetchProductDetailsBloc
    extends Bloc<FetchProductDetailsEvent, FetchProductDetailsState> {
  FetchProductDetailsBloc(
    this._id, {
    required final ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(const FetchProductDetailsState.initial()) {
    on<FetchProductDetailsEvent>(
      (event, emit) => event.map(
        fetchProductDetails: (event) => _onFetchProductDetails(event, emit),
      ),
    );
  }

  final String _id;
  final ProductsRepository _productsRepository;

  ProductDetailsModel? get _currentProductDetails => state.maybeMap(
        loading: (state) => state.oldProductDetails,
        success: (state) => state.productDetails,
        failure: (state) => state.oldProductDetails,
        orElse: () => null,
      );

  Future<void> _onFetchProductDetails(
    _FetchProductDetails event,
    Emitter<FetchProductDetailsState> emit,
  ) async {
    if (state is _Loading) {
      event.completer?.complete();
      return;
    }
    try {
      emit(_Loading(oldProductDetails: _currentProductDetails));
      final productDetails = await _productsRepository.getProductDetails(
        id: _id,
      );
      emit(_Success(productDetails: productDetails));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Error fetching product details',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(message: error.toString()));
    } finally {
      event.completer?.complete();
    }
  }
}
