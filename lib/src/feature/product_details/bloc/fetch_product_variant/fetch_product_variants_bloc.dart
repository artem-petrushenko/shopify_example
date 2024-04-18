import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/product_details/data/repository/products_repository.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_model.dart';

part 'fetch_product_variants_event.dart';

part 'fetch_product_variants_state.dart';

part 'fetch_product_variants_bloc.freezed.dart';

class FetchProductVariantsBloc
    extends Bloc<FetchProductVariantsEvent, FetchProductVariantsState> {
  FetchProductVariantsBloc(
    this._productId, {
    required final ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(const _Initial()) {
    on<FetchProductVariantsEvent>(
      (event, emit) => event.map(
        fetchProductVariants: (event) => _onFetchProductVariants(event, emit),
      ),
    );
  }

  final String _productId;
  final ProductsRepository _productsRepository;

  List<ProductVariantModel> get _variants => state.maybeMap(
        success: (state) => state.variants,
        loading: (state) => state.oldVariants,
        failure: (state) => state.oldVariants,
        orElse: () => [],
      );

  Future<void> _onFetchProductVariants(
    _FetchProductVariants event,
    Emitter<FetchProductVariantsState> emit,
  ) async {
    if (state is _Loading) {
      event.completer?.complete();
      return;
    }
    try {
      emit(_Loading(oldVariants: _variants));
      final variants =
          await _productsRepository.getProductVariant(id: _productId);
      emit(_Success(variants: variants.variants.variants));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch product variants',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(
        message: 'Failed to fetch product variants',
        oldVariants: _variants,
      ));
    } finally {
      event.completer?.complete();
    }
  }
}
