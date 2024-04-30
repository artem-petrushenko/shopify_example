import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/cart/data/repository/cart_repository.dart';
import 'package:shopify_example/src/feature/cart/model/cost/cart_cost_model.dart';

part 'fetch_cart_cost_event.dart';

part 'fetch_cart_cost_state.dart';

part 'fetch_cart_cost_bloc.freezed.dart';

class FetchCartCostBloc extends Bloc<FetchCartCostEvent, FetchCartCostState> {
  FetchCartCostBloc({required final CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const _Initial()) {
    on<FetchCartCostEvent>(
      (event, emit) => event.map(
        fetchCartCost: (event) => _onFetchCartCost(event, emit),
      ),
    );
  }

  final CartRepository _cartRepository;

  CartCostModel? get cart => state.maybeMap(
        loading: (state) => state.cost,
        success: (state) => state.cost,
        failure: (state) => state.cost,
        orElse: () => null,
      );

  Future<void> _onFetchCartCost(
    _FetchCartCost event,
    Emitter<FetchCartCostState> emit,
  ) async {
    if (state is _Loading) {
      event.completer?.complete();
      return;
    }
    try {
      emit(const _Loading());
      final response = await _cartRepository.fetchCheckoutCart();
      emit(_Success(cost: response.cost));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch cart cost.',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(
        message: 'Failed to fetch cart cost.',
        cost: cart,
      ));
    } finally {
      event.completer?.complete();
    }
  }
}
