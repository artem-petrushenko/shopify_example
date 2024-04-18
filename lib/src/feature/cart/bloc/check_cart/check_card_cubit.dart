import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/cart/data/repository/cart_repository.dart';

part 'check_card_state.dart';

part 'check_card_cubit.freezed.dart';

class CheckCardCubit extends Cubit<CheckCardState> {
  CheckCardCubit({
    required final CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const _Initial());

  final CartRepository _cartRepository;

  Future<void> fetchCart() async {
    if (state is _Loading) return;
    try {
      emit(const _Loading());
      final cartId = await _cartRepository.fetchCartId();
      emit(_Success(cartId: cartId));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch cart',
        error: error,
        stackTrace: stackTrace,
      );
      emit(const _Failure(message: 'Failed to fetch cart'));
    }
  }
}
