import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/auth/data/repository/customer_repository.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_model.dart';

part 'fetch_customer_default_address_event.dart';

part 'fetch_customer_default_address_state.dart';

part 'fetch_customer_default_address_bloc.freezed.dart';

class FetchCustomerDefaultAddressBloc extends Bloc<
    FetchCustomerDefaultAddressEvent, FetchCustomerDefaultAddressState> {
  FetchCustomerDefaultAddressBloc({
    required final CustomerRepository customerRepository,
  })  : _customerRepository = customerRepository,
        super(const _Initial()) {
    on<FetchCustomerDefaultAddressEvent>((event, emit) =>
        event.map(fetchAddress: (event) => _onFetchAddress(event, emit)));
  }

  final CustomerRepository _customerRepository;

  Future<void> _onFetchAddress(
    _FetchAddress event,
    Emitter<FetchCustomerDefaultAddressState> emit,
  ) async {
    if (state is _Loading) return;

    try {
      emit(const _Loading());
      final address = await _customerRepository.getCustomerDefaultAddress();
      emit(_Success(address: address));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch default address',
        error: error,
        stackTrace: stackTrace,
      );
      emit(const _Failure(message: 'Failed to fetch default address'));
    }
  }
}
